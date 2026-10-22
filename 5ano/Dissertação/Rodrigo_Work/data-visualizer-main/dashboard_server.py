#!/usr/bin/env python3
"""
Live dashboard for eBPF flow snapshots published over ZMQ.

Each configured endpoint is treated as a separate device: it gets its own
SUB socket (so we always know which device a snapshot came from, which a
single socket subscribed to multiple endpoints cannot tell you) and its own
receiver thread. State is aggregated in memory and pushed to browsers over
Server-Sent Events; a plain HTTP endpoint serves the initial snapshot.
"""
import json
import os
import queue
import threading
import time
from collections import deque
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import urlparse

import zmq

try:
    from kubernetes import client as k8s_client_lib
    from kubernetes import config as k8s_config
except ImportError:
    k8s_client_lib = None
    k8s_config = None


def env_int(name, default):
    value = os.environ.get(name)
    return int(value) if value else default


def env_str(name, default):
    return os.environ.get(name) or default


# ---------------------------------------------------------------------------
# Configuration
#
# DEVICES and TOPOLOGY below are the built-in defaults. Set DASHBOARD_CONFIG
# to a JSON file with "devices" and/or "topology" keys (same shape as below)
# to override them without rebuilding the image -- deployments/dashboard.yaml
# mounts one from a ConfigMap. The scalar settings further down can each be
# overridden by an environment variable of the same name.
# ---------------------------------------------------------------------------

DEFAULT_DEVICES = [
    {"id": "10.0.10.13", "endpoint": "tcp://10.0.10.13:5556"},
    {"id": "10.0.10.12", "endpoint": "tcp://10.0.10.12:5556"},
]
TOPIC = "flows"

# What the dashboard knows about the physical side of the in-vehicle cluster
# (the HPC/control-plane "Vehicle Computer" + each zone's flow_monitor device
# and Kubernetes node), used by the frontend's vehicle topology view.
# Flow-monitor liveness (see device_public_state) drives the zone status dot;
# real Kubernetes node state is matched up at runtime by k8s_poll_thread,
# keyed by these same zone/master ids.
#
# This doesn't decide which zones exist: the view draws every zone the
# NetworkTopology resource describes, whether or not it's listed here, plus
# any zone listed here with a device_id. Add a zone here once it has a
# flow_monitor and/or a Kubernetes node, to get live state for it.
DEFAULT_TOPOLOGY = {
    # The Vehicle Computer is zone 3 itself (drawn in the middle of the car),
    # so a NetworkTopology switch with zone "zone3" is the HPC's switch -- the
    # core switch the other zonal switches link to.
    "master": {"id": "hpc-master", "label": "Vehicle Computer", "role": "Kubernetes control-plane (HPC)",
               "zone": "zone-3"},
    "zones": [
        # node_name is the zone's Kubernetes Node object (kubectl get nodes),
        # which is *not* derivable from device_id: the gateways are
        # multi-homed, with the ZMQ endpoint on a separate vehicle-network
        # NIC from the one Kubernetes registers as the node's address.
        {"id": "zone-1", "label": "Zone 1", "device_id": "10.0.10.13", "node_name": "ms265"},
        {"id": "zone-2", "label": "Zone 2", "device_id": "10.0.10.12", "node_name": "ms270"},
    ],
}


def load_config():
    """(devices, topology) from the DASHBOARD_CONFIG JSON file, falling back
    to the built-in defaults for whichever key it leaves out. A path that's
    set but unreadable is an error, not a silent fallback."""
    path = os.environ.get("DASHBOARD_CONFIG")
    if not path:
        return DEFAULT_DEVICES, DEFAULT_TOPOLOGY
    with open(path) as f:
        cfg = json.load(f)
    return cfg.get("devices", DEFAULT_DEVICES), cfg.get("topology", DEFAULT_TOPOLOGY)


DEVICES, TOPOLOGY = load_config()

# Label the Deployment's own nodeSelector targets, used here to find the
# same control-plane/HPC node from the Kubernetes API side. Overridden as
# MASTER_NODE_LABEL=key=value.
MASTER_NODE_LABEL = tuple(env_str("MASTER_NODE_LABEL", "node-role.kubernetes.io/control-plane=true").split("=", 1))
K8S_POLL_INTERVAL_S = env_int("K8S_POLL_INTERVAL_S", 15)
# CRDs/CRs change far less often than node state, and listing every CRD's
# instances on every poll is more API calls than the node poll, so it gets
# its own (slower) interval rather than sharing K8S_POLL_INTERVAL_S.
CRD_POLL_INTERVAL_S = env_int("CRD_POLL_INTERVAL_S", 20)
# Only CRDs in this API group are shown (e.g. NetworkTopology in the image
# is networktopologies.tsn.dev) -- set to "*" to show every CRD in the
# cluster instead.
CRD_GROUP_FILTER = env_str("CRD_GROUP_FILTER", "tsn.dev")
if CRD_GROUP_FILTER == "*":
    CRD_GROUP_FILTER = None

# The sdv-operator (sdv-operator.py) Deployment that reconciles tsnswitch/
# networktopology/tsnflow CRs against the TSN switches over NETCONF. There's
# no liveness/health endpoint on the operator itself, so "online" here just
# means its Deployment reports enough ready replicas -- same signal kubectl
# would give you, polled on the same cadence as node state.
OPERATOR_DEPLOYMENT_NAME = env_str("OPERATOR_DEPLOYMENT_NAME", "sdv-operator")
OPERATOR_NAMESPACE = env_str("OPERATOR_NAMESPACE", "default")

# Label on each TSN app's Deployment naming the app -- the name TsnFlow
# talkers/listeners refer to. The Deployment's node affinity is what places
# the app in a zone (see deployment_created in sdv-operator.py).
TSN_APP_LABEL = "tsn.dev/cr-name"

# Pods in these namespaces aren't listed in the zone boxes (comma-separated).
POD_NAMESPACE_EXCLUDE = {ns.strip() for ns in env_str("POD_NAMESPACE_EXCLUDE", "kube-system").split(",") if ns.strip()}

HTTP_HOST = "0.0.0.0"
HTTP_PORT = env_int("HTTP_PORT", 8765)

HISTORY_LEN = 300          # points kept per device for the throughput chart
# Coarser history for the chart's longer ranges: snapshots are averaged into
# buckets of this many seconds, and this many buckets are kept (1 h).
LONG_HISTORY_BUCKET_S = 10
LONG_HISTORY_LEN = 360
STALE_AFTER_S = 5          # no snapshot for this long -> "stale"
DEAD_AFTER_S = 20          # no snapshot for this long -> "down"
EVENT_LOG_LEN = 200        # most recent events kept for the timeline panel

STATIC_DIR = Path(__file__).parent / "static"
ICON_FILES = {
    "/favicon.ico": "image/x-icon",
    "/favicon.png": "image/png",
    "/apple-touch-icon.png": "image/png",
}

# ---------------------------------------------------------------------------
# Shared state
# ---------------------------------------------------------------------------

state_lock = threading.Lock()
devices_state = {
    d["id"]: {
        "id": d["id"],
        "endpoint": d["endpoint"],
        "last_seen": None,       # wall-clock time.time() of last snapshot
        "snapshot": None,        # raw last snapshot (ts_unix_ns, flows)
        "history": deque(maxlen=HISTORY_LEN),
        "history_long": deque(maxlen=LONG_HISTORY_LEN),
        "bucket": None,          # the LONG_HISTORY_BUCKET_S bucket still being filled, see add_to_long_history
    }
    for d in DEVICES
}

subscribers = []   # list[queue.Queue] of connected SSE clients
subscribers_lock = threading.Lock()

k8s_lock = threading.Lock()
k8s_state = {}   # topology id (zone id / master id) -> node_public_state(), or absent if unmatched
_k8s_warned_unmatched = set()   # zone node_name / "master", logged once each to avoid spamming every poll

operator_lock = threading.Lock()
operator_state = {}   # operator_public_state() for OPERATOR_DEPLOYMENT_NAME, or {} before the first poll
_operator_warned_missing = False   # logged once if the Deployment isn't found, to avoid spamming every poll

crd_lock = threading.Lock()
crd_state = {}   # CRD metadata.name (e.g. "networktopologies.tsn.dev") -> crd_public_state()
crd_last_poll = None   # time.time() of the most recent completed CRD poll, so the frontend can show a countdown to the next one
crd_poll_trigger = threading.Event()   # set to wake k8s_crd_poll_thread immediately, e.g. from the "force update" button
crd_poller_active = False   # whether k8s_crd_poll_thread was actually started (needs a reachable cluster)
_crd_warned_unlistable = set()   # CRD names we've already logged a list failure for, to avoid spamming every poll

events_lock = threading.Lock()
events = deque(maxlen=EVENT_LOG_LEN)   # record_event() entries, oldest first

background_threads = []   # every thread start_thread() launched, checked by /healthz


def summarize(snap):
    flows = snap.get("flows", [])
    by_proto = {}
    total_packets = 0
    total_bytes = 0
    total_bps = 0.0
    for f in flows:
        proto = f.get("proto")
        p = by_proto.setdefault(proto, {"proto": proto, "packets": 0, "bytes": 0})
        p["packets"] += f.get("packets", 0)
        p["bytes"] += f.get("total_bytes", 0)
        total_packets += f.get("packets", 0)
        total_bytes += f.get("total_bytes", 0)
        total_bps += f.get("throughput_bps") or 0
    return {
        "flow_count": len(flows),
        "total_packets": total_packets,
        "total_bytes": total_bytes,
        "total_throughput_bps": total_bps,
        "by_proto": sorted(by_proto.values(), key=lambda p: p["packets"], reverse=True),
    }


def broadcast(event_type, payload):
    data = json.dumps(payload)
    msg = f"event: {event_type}\ndata: {data}\n\n"
    with subscribers_lock:
        dead = []
        for q in subscribers:
            try:
                q.put_nowait(msg)
            except queue.Full:
                dead.append(q)
        for q in dead:
            subscribers.remove(q)


def record_event(severity, source, message):
    """Adds an entry to the event timeline and pushes it to browsers.
    severity is one of "good", "info", "warning", "critical"."""
    event = {"t": time.time(), "severity": severity, "source": source, "message": message}
    with events_lock:
        events.append(event)
    broadcast("event", event)


def add_to_long_history(dev, point):
    """Folds a history point into dev's current LONG_HISTORY_BUCKET_S bucket.
    When the point starts a new bucket, the previous one is closed into
    dev["history_long"] and returned (else None). A closed bucket keeps the
    mean and peak throughput over its snapshots, and the last snapshot's
    totals. Call with state_lock held."""
    start = point["t"] - point["t"] % LONG_HISTORY_BUCKET_S
    bucket = dev["bucket"]
    closed = None
    if bucket is not None and bucket["t"] != start:
        last = bucket["last"]
        closed = {
            "t": bucket["t"],
            "throughput_bps": bucket["sum_bps"] / bucket["n"],
            "throughput_max_bps": bucket["max_bps"],
            "packets": last["packets"],
            "bytes": last["bytes"],
            "flow_count": last["flow_count"],
        }
        dev["history_long"].append(closed)
        bucket = None
    if bucket is None:
        bucket = dev["bucket"] = {"t": start, "sum_bps": 0.0, "max_bps": 0.0, "n": 0, "last": None}
    bucket["sum_bps"] += point["throughput_bps"]
    bucket["max_bps"] = max(bucket["max_bps"], point["throughput_bps"])
    bucket["n"] += 1
    bucket["last"] = point
    return closed


def device_public_state(dev, include_long_history=False):
    now = time.time()
    last_seen = dev["last_seen"]
    if last_seen is None:
        status = "down"
    elif now - last_seen <= STALE_AFTER_S:
        status = "live"
    elif now - last_seen <= DEAD_AFTER_S:
        status = "stale"
    else:
        status = "down"
    public = {
        "id": dev["id"],
        "endpoint": dev["endpoint"],
        "status": status,
        "last_seen": last_seen,
        "snapshot": dev["snapshot"],
        "summary": summarize(dev["snapshot"]) if dev["snapshot"] else None,
        "history": list(dev["history"]),
    }
    # The long history only goes out with the full state; after that,
    # browsers append each newly closed bucket from "history_long" events
    # rather than getting all of it again with every snapshot.
    if include_long_history:
        public["history_long"] = list(dev["history_long"])
    return public


def full_state():
    with state_lock:
        devices = [device_public_state(devices_state[d["id"]], include_long_history=True) for d in DEVICES]
    with k8s_lock:
        k8s = dict(k8s_state)
    with crd_lock:
        crds = dict(crd_state)
        crd_poll = {"interval_s": CRD_POLL_INTERVAL_S, "last_poll": crd_last_poll}
    with operator_lock:
        operator = dict(operator_state)
    with events_lock:
        event_list = list(events)
    return {"devices": devices, "topology": TOPOLOGY, "k8s": k8s, "crds": crds, "crd_poll": crd_poll,
            "operator": operator, "events": event_list}


# ---------------------------------------------------------------------------
# ZMQ receiver threads (one SUB socket per device/endpoint)
# ---------------------------------------------------------------------------

def receiver_thread(device_id, endpoint):
    ctx = zmq.Context.instance()
    sub = ctx.socket(zmq.SUB)
    sub.setsockopt(zmq.RCVTIMEO, 1000)
    sub.setsockopt(zmq.LINGER, 0)
    sub.connect(endpoint)
    sub.setsockopt_string(zmq.SUBSCRIBE, TOPIC)

    while True:
        try:
            _topic, payload = sub.recv_multipart()
        except zmq.Again:
            continue
        except zmq.ZMQError:
            time.sleep(0.5)
            continue

        try:
            snap = json.loads(payload)
        except json.JSONDecodeError:
            continue

        now = time.time()
        summary = summarize(snap)
        point = {
            "t": snap.get("ts_unix_ns", now * 1e9) / 1e9,
            "throughput_bps": summary["total_throughput_bps"],
            "packets": summary["total_packets"],
            "bytes": summary["total_bytes"],
            "flow_count": summary["flow_count"],
        }
        with state_lock:
            dev = devices_state[device_id]
            dev["last_seen"] = now
            dev["snapshot"] = snap
            dev["history"].append(point)
            closed = add_to_long_history(dev, point)
            public = device_public_state(dev)

        broadcast("snapshot", {"device_id": device_id, "device": public})
        if closed is not None:
            broadcast("history_long", {"device_id": device_id, "point": closed})


DEVICE_STATUS_EVENTS = {
    "live": ("good", "is live"),
    "stale": ("warning", f"is stale (no snapshot for {STALE_AFTER_S}s)"),
    "down": ("critical", f"is down (no snapshot for {DEAD_AFTER_S}s)"),
}


def device_label(device_id):
    zone = next((z for z in TOPOLOGY["zones"] if z.get("device_id") == device_id), None)
    return f"{zone['label']} flow_monitor ({device_id})" if zone else f"flow_monitor {device_id}"


def watchdog_thread():
    """Periodically re-announce device status so 'live -> stale -> down'
    transitions show up even when a device has stopped sending entirely,
    and log each transition to the event timeline. A device's first status
    after startup is just remembered, not logged."""
    last_status = {}
    while True:
        time.sleep(1)
        with state_lock:
            snapshot = {d["id"]: device_public_state(devices_state[d["id"]]) for d in DEVICES}
        for device_id, public in snapshot.items():
            broadcast("status", {"device_id": device_id, "device": public})
            status = public["status"]
            prev = last_status.get(device_id)
            last_status[device_id] = status
            if prev is not None and prev != status:
                severity, text = DEVICE_STATUS_EVENTS[status]
                record_event(severity, "flow_monitor", f"{device_label(device_id)} {text}")


# ---------------------------------------------------------------------------
# Kubernetes node-state poller
#
# Matches each zone to a Node object by name (see TOPOLOGY's node_name — the
# zonal gateways are multi-homed, so the vehicle-network IP in device_id
# isn't the Node's registered address), and the master to whichever Node
# carries MASTER_NODE_LABEL — the same label the dashboard's own Deployment
# is scheduled with.
# ---------------------------------------------------------------------------

def k8s_init():
    """Load in-cluster credentials and return (CoreV1Api, ApiextensionsV1Api,
    CustomObjectsApi, AppsV1Api), or (None, None, None, None) if the
    kubernetes package is missing or no cluster config is reachable (e.g.
    running dashboard_server.py standalone outside the cluster)."""
    if k8s_client_lib is None:
        print("Kubernetes state: 'kubernetes' package not installed, skipping.")
        return None, None, None, None
    try:
        k8s_config.load_incluster_config()
    except Exception:
        try:
            k8s_config.load_kube_config()
        except Exception as e:
            print(f"Kubernetes state: no reachable cluster config ({e}), skipping.")
            return None, None, None, None
    return (
        k8s_client_lib.CoreV1Api(),
        k8s_client_lib.ApiextensionsV1Api(),
        k8s_client_lib.CustomObjectsApi(),
        k8s_client_lib.AppsV1Api(),
    )


def parse_cpu_quantity(q):
    if not q:
        return None
    if q.endswith("n"):
        return int(q[:-1]) / 1e9
    if q.endswith("m"):
        return int(q[:-1]) / 1e3
    return float(q)


def parse_memory_quantity(q):
    if not q:
        return None
    units = {"Ki": 1024, "Mi": 1024**2, "Gi": 1024**3, "Ti": 1024**4,
             "K": 1000, "M": 1000**2, "G": 1000**3, "T": 1000**4}
    for suffix, mult in units.items():
        if q.endswith(suffix):
            return int(q[:-len(suffix)]) * mult
    return int(q)


def node_public_state(node):
    conditions = {c.type: c.status for c in (node.status.conditions or [])}
    alloc = node.status.allocatable or {}
    cap = node.status.capacity or {}
    info = node.status.node_info
    return {
        "node_name": node.metadata.name,
        "ready": conditions.get("Ready") == "True",
        "conditions": conditions,
        "kubelet_version": info.kubelet_version if info else None,
        "cpu_allocatable": parse_cpu_quantity(alloc.get("cpu")),
        "cpu_capacity": parse_cpu_quantity(cap.get("cpu")),
        "memory_allocatable_bytes": parse_memory_quantity(alloc.get("memory")),
        "memory_capacity_bytes": parse_memory_quantity(cap.get("memory")),
    }


def pod_public_state(pod):
    statuses = pod.status.container_statuses or []
    waiting = next((c.state.waiting.reason for c in statuses
                    if c.state and c.state.waiting and c.state.waiting.reason), None)
    return {
        "name": pod.metadata.name,
        "namespace": pod.metadata.namespace,
        "phase": pod.status.phase,
        "ready": bool(statuses) and all(c.ready for c in statuses),
        "terminating": pod.metadata.deletion_timestamp is not None,
        "restarts": sum(c.restart_count or 0 for c in statuses),
        "reason": waiting,   # e.g. CrashLoopBackOff, ImagePullBackOff
        "tsn_app": (pod.metadata.labels or {}).get(TSN_APP_LABEL),
    }


def pods_by_node(v1):
    """Node name -> [pod_public_state()] for every pod scheduled on a node,
    outside POD_NAMESPACE_EXCLUDE. Returns None if pods can't be listed (the
    zone boxes then just don't show pods, rather than showing none)."""
    try:
        pods = v1.list_pod_for_all_namespaces().items
    except Exception as e:
        print(f"Kubernetes pod state: list failed ({e})")
        return None
    by_node = {}
    for pod in pods:
        if not pod.spec.node_name or pod.metadata.namespace in POD_NAMESPACE_EXCLUDE:
            continue
        by_node.setdefault(pod.spec.node_name, []).append(pod_public_state(pod))
    for group in by_node.values():
        group.sort(key=lambda p: (p["namespace"], p["name"]))
    return by_node


def topology_label(topology_id):
    if topology_id == TOPOLOGY["master"]["id"]:
        return TOPOLOGY["master"]["label"]
    zone = next((z for z in TOPOLOGY["zones"] if z["id"] == topology_id), None)
    return zone["label"] if zone else topology_id


def log_node_changes(prev_state, new_state):
    """Logs a node becoming Ready/NotReady, or vanishing from the API, to
    the event timeline (prev_state None = first poll, nothing to compare)."""
    if prev_state is None:
        return
    for topology_id, node in new_state.items():
        prev = prev_state.get(topology_id)
        if prev is None or prev["ready"] != node["ready"]:
            where = f"{topology_label(topology_id)} node {node['node_name']}"
            if node["ready"]:
                record_event("good", "kubernetes", f"{where} is Ready")
            else:
                record_event("critical", "kubernetes", f"{where} is Not Ready")
    for topology_id, prev in prev_state.items():
        if topology_id not in new_state:
            record_event("critical", "kubernetes",
                         f"{topology_label(topology_id)} node {prev['node_name']} is no longer in the cluster")


def k8s_poll_thread(v1):
    label_key, label_value = MASTER_NODE_LABEL
    prev_state = None
    while True:
        try:
            nodes = v1.list_node().items
        except Exception as e:
            print(f"Kubernetes node state: poll failed ({e})")
            time.sleep(K8S_POLL_INTERVAL_S)
            continue
        pods = pods_by_node(v1)

        by_name = {}
        master_node = None
        for node in nodes:
            by_name[node.metadata.name] = node
            if (node.metadata.labels or {}).get(label_key) == label_value:
                master_node = node

        def node_state(node):
            state = node_public_state(node)
            state["pods"] = pods.get(node.metadata.name, []) if pods is not None else None
            return state

        new_state = {}
        for zone in TOPOLOGY["zones"]:
            if not zone.get("node_name"):
                continue  # no Kubernetes node for this zone (yet)
            node = by_name.get(zone["node_name"])
            if node is not None:
                new_state[zone["id"]] = node_state(node)
            elif zone["node_name"] not in _k8s_warned_unmatched:
                _k8s_warned_unmatched.add(zone["node_name"])
                print(f"Kubernetes node state: no Node named {zone['node_name']!r} "
                      f"(zone {zone['id']}); known nodes: {sorted(by_name)}")
        if master_node is not None:
            new_state[TOPOLOGY["master"]["id"]] = node_state(master_node)
        elif "master" not in _k8s_warned_unmatched:
            _k8s_warned_unmatched.add("master")
            print(f"Kubernetes node state: no Node with label {label_key}={label_value!r} for the HPC/master box")

        log_node_changes(prev_state, new_state)
        prev_state = new_state
        with k8s_lock:
            k8s_state.clear()
            k8s_state.update(new_state)
        broadcast("k8s", new_state)
        time.sleep(K8S_POLL_INTERVAL_S)


# ---------------------------------------------------------------------------
# sdv-operator liveness poller
#
# The operator (sdv-operator.py) has no health/metrics endpoint of its own,
# so "online" is read the same way `kubectl get deploy` would show it: the
# Deployment's ready/available replica counts. That confirms the operator's
# pod is up and passing its readiness checks, not that it's mid-reconcile on
# any particular resource right now.
# ---------------------------------------------------------------------------

def deployment_public_state(dep):
    status = dep.status
    conditions = {c.type: c.status for c in (status.conditions or [])}
    desired = dep.spec.replicas if dep.spec.replicas is not None else 0
    ready = status.ready_replicas or 0
    return {
        "name": dep.metadata.name,
        "namespace": dep.metadata.namespace,
        "desired_replicas": desired,
        "ready_replicas": ready,
        "available_replicas": status.available_replicas or 0,
        "conditions": conditions,
        "online": desired > 0 and ready >= desired,
        "error": None,
    }


def operator_poll_thread(apps_v1):
    global _operator_warned_missing
    prev_online = None   # None until the first poll, so startup isn't logged as a change
    while True:
        try:
            dep = apps_v1.read_namespaced_deployment(OPERATOR_DEPLOYMENT_NAME, OPERATOR_NAMESPACE)
            new_state = deployment_public_state(dep)
            _operator_warned_missing = False
        except k8s_client_lib.exceptions.ApiException as e:
            if e.status == 404:
                new_state = {"name": OPERATOR_DEPLOYMENT_NAME, "namespace": OPERATOR_NAMESPACE,
                              "online": False, "error": "not found"}
                if not _operator_warned_missing:
                    _operator_warned_missing = True
                    print(f"sdv-operator state: no Deployment named {OPERATOR_DEPLOYMENT_NAME!r} "
                          f"in namespace {OPERATOR_NAMESPACE!r}")
            else:
                print(f"sdv-operator state: poll failed ({e})")
                new_state = {"name": OPERATOR_DEPLOYMENT_NAME, "namespace": OPERATOR_NAMESPACE,
                              "online": False, "error": str(e)}
        except Exception as e:
            print(f"sdv-operator state: poll failed ({e})")
            new_state = {"name": OPERATOR_DEPLOYMENT_NAME, "namespace": OPERATOR_NAMESPACE,
                          "online": False, "error": str(e)}

        if prev_online is not None and prev_online != new_state["online"]:
            if new_state["online"]:
                record_event("good", "sdv-operator", "sdv-operator is online")
            else:
                detail = new_state.get("error") or (
                    f"{new_state.get('ready_replicas', 0)}/{new_state.get('desired_replicas', 0)} ready")
                record_event("critical", "sdv-operator", f"sdv-operator went offline ({detail})")
        prev_online = new_state["online"]

        with operator_lock:
            operator_state.clear()
            operator_state.update(new_state)
        broadcast("operator", new_state)
        time.sleep(K8S_POLL_INTERVAL_S)


# ---------------------------------------------------------------------------
# Kubernetes CRD / custom-resource poller
#
# Cluster-wide: enumerates every CustomResourceDefinition (e.g. the
# NetworkTopology CRD in the tsn.dev group) and, for each one, lists its
# currently active custom resources so the dashboard shows both "what kinds
# of custom resources can exist here" and "what actually exists right now".
# ---------------------------------------------------------------------------

def crd_instance_summary(obj):
    meta = obj.get("metadata", {})
    summary = {
        "name": meta.get("name"),
        "namespace": meta.get("namespace"),
        "created": meta.get("creationTimestamp"),
        "generation": meta.get("generation"),
        # Full spec, not just identity fields: the frontend renders known
        # kinds (e.g. NetworkTopology's spec.nodes) directly into the
        # vehicle topology view, so it needs the actual resource content.
        "spec": obj.get("spec"),
        # What the sdv-operator last reported doing with this resource
        # (status.sdv, written by set_sdv_status in sdv-operator.py), or
        # None if it hasn't reported anything.
        "sdv_status": (obj.get("status") or {}).get("sdv"),
    }
    return summary


def deployment_zones(dep):
    """The zone values in a TSN app Deployment's required node affinity --
    the same first-term/first-expression the sdv-operator reads (see
    deployment_created in sdv-operator.py) -- or None if it has none."""
    try:
        terms = dep.spec.template.spec.affinity.node_affinity \
            .required_during_scheduling_ignored_during_execution.node_selector_terms
        return list(terms[0].match_expressions[0].values or [])
    except (AttributeError, IndexError, TypeError):
        return None


def app_zones(apps_v1):
    """TSN app name -> zone values, for each Deployment carrying
    TSN_APP_LABEL (the app name TsnFlow talkers/listeners refer to).
    Keyed by name alone, like the operator's depByZone."""
    try:
        deps = apps_v1.list_deployment_for_all_namespaces(label_selector=TSN_APP_LABEL).items
    except Exception as e:
        print(f"Kubernetes CRD state: could not list TSN app Deployments ({e})")
        return {}
    return {(dep.metadata.labels or {}).get(TSN_APP_LABEL): deployment_zones(dep) for dep in deps}


# ---------------------------------------------------------------------------
# TsnFlow route resolution
#
# Mirrors the sdv-operator's own (_resolve_flow_hops and friends in
# sdv-operator.py), so the dashboard shows the switch ports the operator
# configures for a flow, or why it can't: each app's zone is the first value
# of its Deployment's zone affinity; a zone's switch is the NetworkTopology
# node whose `zone` is that exact string; the path is a breadth-first search
# over the nodes' links; and the hops are each switch's egress port along
# the path plus the last switch's zone-facing `port`. Keep the two in step.
# ---------------------------------------------------------------------------

def topology_nodes(state):
    """NetworkTopology spec.nodes by switch id, across every instance."""
    nodes = {}
    for crd in state.values():
        if crd["plural"] != "networktopologies":
            continue
        for inst in crd["instances"]:
            for node in (inst.get("spec") or {}).get("nodes") or []:
                if node.get("id"):
                    nodes[node["id"]] = node
    return nodes


def _flow_path(nodes, src_zone, dst_zone):
    src = next((n["id"] for n in nodes.values() if n.get("zone") == src_zone), None)
    dst = next((n["id"] for n in nodes.values() if n.get("zone") == dst_zone), None)
    if src is None or dst is None:
        return None
    if src == dst:
        return [src]
    visited, frontier = {src}, deque([[src]])
    while frontier:
        path = frontier.popleft()
        for link in nodes.get(path[-1], {}).get("links") or []:
            target = link.get("target")
            if target == dst:
                return path + [target]
            if target in nodes and target not in visited:
                visited.add(target)
                frontier.append(path + [target])
    return None


def resolve_flow(spec, zones_by_app, nodes):
    """{"talker_zone", "listener_zones", "hops": [{"id", "switch", "port"}],
    "error"} for a TsnFlow spec. error is the reason the operator can't
    resolve it (worded like its TemporaryErrors), in which case hops is
    empty."""
    def zone_of(app):
        zones = zones_by_app.get(app)
        return zones[0] if zones else None

    talker, listeners = spec.get("talker"), spec.get("listeners") or []
    route = {"talker_zone": zone_of(talker), "listener_zones": [zone_of(l) for l in listeners],
             "hops": [], "error": None}
    if route["talker_zone"] is None:
        route["error"] = f"Talker {talker} not scheduled to a zone yet."
        return route
    hops = {}
    for listener, listener_zone in zip(listeners, route["listener_zones"]):
        if listener_zone is None:
            route["error"] = f"Listener {listener} not scheduled to a zone yet."
            return route
        path = _flow_path(nodes, route["talker_zone"], listener_zone)
        if path is None:
            known = sorted({str(n.get("zone")) for n in nodes.values() if n.get("zone")})
            route["error"] = (f"No switch path found between zones {route['talker_zone']} and {listener_zone} "
                              f"(NetworkTopology zones: {', '.join(known) or 'none'}).")
            return route
        for a, b in zip(path, path[1:]):
            port = next((l.get("port") for l in nodes[a].get("links") or [] if l.get("target") == b), None)
            if port is None:
                route["error"] = "Topology link missing a port for a hop on the resolved path."
                return route
            hops[(a, port)] = True
        hops[(path[-1], nodes[path[-1]].get("port"))] = True
    route["hops"] = [{"id": sw, "switch": nodes[sw].get("switchRef"), "port": port} for sw, port in hops]
    return route


SDV_STATE_SEVERITY = {"Applied": "good", "Connected": "good", "Accepted": "good",
                      "Waiting": "warning", "Failed": "critical"}


def log_cr_changes(prev_state, new_state):
    """Logs custom resources being created or deleted, and changes in what
    the sdv-operator reports for them, to the event timeline (prev_state
    None = first poll, nothing to compare)."""
    if prev_state is None:
        return

    def index(state):
        return {(crd["kind"], i["namespace"], i["name"]): i
                for crd in state.values() for i in crd["instances"]}

    before, after = index(prev_state), index(new_state)
    label = lambda key: f"{key[0]} {key[1] + '/' if key[1] else ''}{key[2]}"
    for key, inst in after.items():
        old = before.get(key)
        if old is None:
            record_event("info", "kubernetes", f"{label(key)} created")
        new_sdv, old_sdv = inst.get("sdv_status") or {}, (old or {}).get("sdv_status") or {}
        if new_sdv.get("state") and new_sdv.get("state") != old_sdv.get("state"):
            message = f": {new_sdv['message']}" if new_sdv.get("message") else ""
            record_event(SDV_STATE_SEVERITY.get(new_sdv["state"], "info"), "sdv-operator",
                         f"{label(key)} {new_sdv['state']}{message}")
    for key in before.keys() - after.keys():
        record_event("info", "kubernetes", f"{label(key)} deleted")


def crd_public_state(crd, instances):
    conditions = {c.type: c.status for c in (crd.status.conditions or [])}
    names = crd.spec.names
    versions = crd.spec.versions or []
    storage_version = next((v.name for v in versions if v.storage), None)
    return {
        "name": crd.metadata.name,
        "group": crd.spec.group,
        "kind": names.kind,
        "plural": names.plural,
        "scope": crd.spec.scope,
        "versions": [v.name for v in versions],
        "storage_version": storage_version,
        "established": conditions.get("Established") == "True",
        "instances": instances,
        "instance_count": len(instances),
    }


def k8s_crd_poll_thread(apiext_v1, custom_objects_api, apps_v1):
    global crd_last_poll
    prev_state = None
    while True:
        try:
            crds = apiext_v1.list_custom_resource_definition().items
        except Exception as e:
            print(f"Kubernetes CRD state: poll failed ({e})")
            with crd_lock:
                crd_last_poll = time.time()
            broadcast("crd_poll", {"interval_s": CRD_POLL_INTERVAL_S, "last_poll": crd_last_poll})
            crd_poll_trigger.wait(CRD_POLL_INTERVAL_S)
            crd_poll_trigger.clear()
            continue

        new_state = {}
        for crd in crds:
            if CRD_GROUP_FILTER is not None and crd.spec.group != CRD_GROUP_FILTER:
                continue
            storage_version = next((v.name for v in (crd.spec.versions or []) if v.storage), None)
            if storage_version is None:
                continue  # malformed CRD (no storage version); nothing we can list
            try:
                # list_cluster_custom_object lists across all namespaces for a
                # Namespaced-scope CRD, and lists the objects directly for a
                # Cluster-scope one -- same call works for both.
                resp = custom_objects_api.list_cluster_custom_object(
                    crd.spec.group, storage_version, crd.spec.names.plural
                )
                items = resp.get("items", [])
            except Exception as e:
                items = []
                if crd.metadata.name not in _crd_warned_unlistable:
                    _crd_warned_unlistable.add(crd.metadata.name)
                    print(f"Kubernetes CRD state: could not list instances of {crd.metadata.name} ({e})")

            instances = sorted(
                (crd_instance_summary(o) for o in items),
                key=lambda i: (i["namespace"] or "", i["name"] or ""),
            )
            new_state[crd.metadata.name] = crd_public_state(crd, instances)

        # Each TsnFlow gets the switch ports its shaping lands on (see
        # resolve_flow), once every NetworkTopology has been read.
        flows = [i for crd in new_state.values() if crd["plural"] == "tsnflows" for i in crd["instances"]]
        if flows:
            zones_by_app, nodes = app_zones(apps_v1), topology_nodes(new_state)
            for inst in flows:
                inst["route"] = resolve_flow(inst.get("spec") or {}, zones_by_app, nodes)

        log_cr_changes(prev_state, new_state)
        prev_state = new_state
        with crd_lock:
            crd_state.clear()
            crd_state.update(new_state)
            crd_last_poll = time.time()
        broadcast("crds", new_state)
        broadcast("crd_poll", {"interval_s": CRD_POLL_INTERVAL_S, "last_poll": crd_last_poll})
        crd_poll_trigger.wait(CRD_POLL_INTERVAL_S)
        crd_poll_trigger.clear()


# ---------------------------------------------------------------------------
# HTTP + SSE server
# ---------------------------------------------------------------------------

class Handler(BaseHTTPRequestHandler):
    protocol_version = "HTTP/1.1"

    def log_message(self, fmt, *args):
        pass  # keep the console quiet; flow noise isn't useful here

    def _send_file(self, path, content_type):
        try:
            data = path.read_bytes()
        except FileNotFoundError:
            self.send_error(404)
            return
        self.send_response(200)
        self.send_header("Content-Type", content_type)
        self.send_header("Content-Length", str(len(data)))
        self.send_header("Cache-Control", "no-cache")
        self.end_headers()
        self.wfile.write(data)

    def _send_json(self, payload, status=200):
        body = json.dumps(payload).encode()
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.send_header("Cache-Control", "no-cache")
        self.end_headers()
        self.wfile.write(body)

    def do_GET(self):
        path = urlparse(self.path).path

        if path == "/" or path == "/index.html":
            self._send_file(STATIC_DIR / "dashboard.html", "text/html; charset=utf-8")
            return

        if path in ICON_FILES:
            self._send_file(STATIC_DIR / path.lstrip("/"), ICON_FILES[path])
            return

        if path == "/api/state":
            self._send_json(full_state())
            return

        if path == "/healthz":
            # Cheap check for the Kubernetes probes: the server answering
            # at all, plus every background thread still running (they
            # loop forever, so a dead one means an unhandled exception).
            dead = [t.name for t in background_threads if not t.is_alive()]
            self._send_json({"ok": not dead, "dead_threads": dead}, 503 if dead else 200)
            return

        if path == "/events":
            self.send_response(200)
            self.send_header("Content-Type", "text/event-stream")
            self.send_header("Cache-Control", "no-cache")
            self.send_header("Connection", "keep-alive")
            self.end_headers()

            q = queue.Queue(maxsize=100)
            with subscribers_lock:
                subscribers.append(q)
            try:
                while True:
                    try:
                        msg = q.get(timeout=15)
                    except queue.Empty:
                        msg = ": keepalive\n\n"
                    self.wfile.write(msg.encode())
                    self.wfile.flush()
            except (BrokenPipeError, ConnectionResetError):
                pass
            finally:
                with subscribers_lock:
                    if q in subscribers:
                        subscribers.remove(q)
            return

        self.send_error(404)

    def do_POST(self):
        path = urlparse(self.path).path

        if path.startswith("/api/reset/"):
            device_id = path[len("/api/reset/"):]
            with state_lock:
                dev = devices_state.get(device_id)
                if dev is None:
                    self.send_error(404)
                    return
                dev["history"].clear()
                dev["history_long"].clear()
                dev["bucket"] = None
                dev["snapshot"] = None
                public = device_public_state(dev)
            broadcast("reset", {"device_id": device_id})
            broadcast("status", {"device_id": device_id, "device": public})
            self._send_json({"ok": True})
            return

        if path == "/api/crds/refresh":
            if not crd_poller_active:
                self.send_error(503, "CRD polling is not active (no reachable Kubernetes cluster)")
                return
            crd_poll_trigger.set()
            self._send_json({"ok": True})
            return

        self.send_error(404)


def start_thread(name, target, *args):
    thread = threading.Thread(target=target, args=args, daemon=True, name=name)
    thread.start()
    background_threads.append(thread)


def main():
    for d in DEVICES:
        start_thread(f"receiver {d['id']}", receiver_thread, d["id"], d["endpoint"])
    start_thread("watchdog", watchdog_thread)

    v1, apiext_v1, custom_objects_api, apps_v1 = k8s_init()
    if v1 is not None:
        start_thread("k8s nodes", k8s_poll_thread, v1)
    if apiext_v1 is not None:
        global crd_poller_active
        crd_poller_active = True
        start_thread("k8s crds", k8s_crd_poll_thread, apiext_v1, custom_objects_api, apps_v1)
    if apps_v1 is not None:
        start_thread("sdv-operator", operator_poll_thread, apps_v1)

    server = ThreadingHTTPServer((HTTP_HOST, HTTP_PORT), Handler)
    print(f"Dashboard: http://{HTTP_HOST}:{HTTP_PORT}/")
    for d in DEVICES:
        print(f"  device {d['id']}  <-  {d['endpoint']}")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass


if __name__ == "__main__":
    main()
