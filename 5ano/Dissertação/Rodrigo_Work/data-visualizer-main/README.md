# Data Visualizer

A live dashboard for network flow snapshots published by eBPF probes over ZMQ.

Each monitored device publishes periodic flow snapshots (packet/byte counts
per flow, keyed by protocol and endpoint pair) on a ZMQ `PUB` socket. This
repo has two consumers for that data:

- **`dashboard_server.py`** — subscribes to one or more devices (one `SUB`
  socket + receiver thread per device, so snapshots stay attributable to
  their source), aggregates state in memory, and serves it to a browser as
  Server-Sent Events. A plain HTTP endpoint (`/api/state`) returns the
  current snapshot for polling clients. The frontend lives in
  [static/dashboard.html](static/dashboard.html) and includes a vehicle
  topology view and a Kubernetes custom resources view alongside the
  per-device panels (see below).
- **`subscriber.py`** — a minimal terminal client that connects to the same
  ZMQ endpoints and prints each incoming flow snapshot as a refreshing table.
  Useful for quick debugging without the web UI.

## Requirements

- Python 3.12+
- [pyzmq](https://pyzmq.readthedocs.io/) and the
  [kubernetes](https://github.com/kubernetes-client/python) client (see
  [requirements.txt](requirements.txt))

Install dependencies:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Configuration

`dashboard_server.py` has two structured settings:

- `DEVICES` — the flow_monitors to subscribe to (`id` + ZMQ `endpoint`).
- `TOPOLOGY` — what the dashboard knows about each zone: zone `id`/`label`,
  the `device_id` it corresponds to, and the `node_name` of its Kubernetes
  `Node` (see below, these aren't always the same host-facing address), plus
  a `master` entry for the central HPC/control-plane node. `TOPOLOGY` only
  describes the physical side of a zone; which zones exist comes from the
  `NetworkTopology` resource (see below), so a zone only needs an entry here
  once it has a flow_monitor or a Kubernetes node. Update it alongside
  `DEVICES` when that changes.

Both have built-in defaults (`DEFAULT_DEVICES` / `DEFAULT_TOPOLOGY`). To
change them without editing the code or rebuilding the image, point
`DASHBOARD_CONFIG` at a JSON file with `devices` and/or `topology` keys in
the same shape; a key it leaves out keeps its default:

```bash
DASHBOARD_CONFIG=./my-config.json python3 dashboard_server.py
```

On Kubernetes this file comes from the `flow-dashboard-config` ConfigMap
(see [Kubernetes](#kubernetes)). It's read once at startup.

These environment variables override the scalar settings:

| Variable | Default | Meaning |
| --- | --- | --- |
| `HTTP_PORT` | `8765` | Port the dashboard listens on |
| `K8S_POLL_INTERVAL_S` | `15` | Node, pod and operator poll interval |
| `CRD_POLL_INTERVAL_S` | `20` | Custom resource poll interval |
| `CRD_GROUP_FILTER` | `tsn.dev` | API group of the CRDs shown (`*` for all) |
| `OPERATOR_DEPLOYMENT_NAME` | `sdv-operator` | sdv-operator Deployment name |
| `OPERATOR_NAMESPACE` | `default` | sdv-operator Deployment namespace |
| `MASTER_NODE_LABEL` | `node-role.kubernetes.io/control-plane=true` | Label that identifies the HPC node |
| `POD_NAMESPACE_EXCLUDE` | `kube-system` | Comma-separated namespaces whose pods aren't listed |

`subscriber.py` still has its endpoints hardcoded (`ENDPOINT1` /
`ENDPOINT2`).

## Vehicle topology view

The dashboard renders the cluster over an in-vehicle network diagram: a
semi-transparent vehicle outline with one box per zone (every zone the
`NetworkTopology` resource describes, plus any `TOPOLOGY` zone with a
flow_monitor — see below) wired to
a central "Vehicle Computer" (HPC) box, matching the testbed's physical
layout — one Kubernetes worker node per zonal gateway, with a Kubernetes
master node as the central HPC. Zone 3 is always the Vehicle Computer itself
(`TOPOLOGY["master"]["zone"]` is `zone-3`), so it never gets a zone box.

The other zones sit in columns from the front of the car (left) to the
rear, two per column: zones 1/2 in the front column (top/bottom), 4/5 in the
next, then 6/7, and so on. Front columns go left of the middle, rear ones
right of it, and the canvas widens a column at a time as zones are added. A
zone's position comes from its number, so it keeps its place whether or not
the zones around it exist. There's always at least one column on each
side of the middle, so the view keeps its proportions while only the front
zones exist.

The **Vehicle** button in the header (next to **Theme**) changes the vehicle
drawn behind the diagram: Sedan, Pickup, Van, Bus, or Semi truck. Each click
moves to the next one, and the choice is saved in the browser's
`localStorage` (`flow-dashboard-vehicle`), so it's kept across reloads.
Switching redraws only the outline, not the zones or switches. All the
outlines are defined in `VEHICLES` in
[static/dashboard.html](static/dashboard.html), top-down with the nose on
the left. Each is built from the canvas size, so it gets longer as columns
are added instead of stretching. To add another vehicle, add an entry with
a `label` and a `draw()` function; the button picks it up automatically.

A zone with a `TOPOLOGY` entry shows two independent signals, both pushed
over the same SSE stream as the per-device panels (a zone the resource
describes without any device behind it just says it has no flow_monitor or
Kubernetes node):

- **Flow-monitor liveness** (the dot + top status line) — live/stale/down,
  same as the per-device panels, derived from ZMQ snapshot recency.
- **Kubernetes node state** (the line at the bottom) — Ready condition,
  kubelet version, and allocatable vCPU/memory, polled from the cluster API
  by `k8s_poll_thread` in `dashboard_server.py` every
  `K8S_POLL_INTERVAL_S` (15s by default). A zone is matched to a `Node` by
  name, via `node_name` on its `TOPOLOGY` entry — *not* derived from
  `device_id`, since the zonal gateways are multi-homed: the ZMQ endpoint
  sits on a separate vehicle-network NIC from the one Kubernetes registers
  as the node's address. Update `node_name` alongside `device_id` if a
  zone's flow_monitor moves to a different node. The HPC box is matched by
  `MASTER_NODE_LABEL` instead (the same `node-role.kubernetes.io/control-plane`
  label its own Deployment is scheduled with), and its dot reflects that
  node's Ready condition directly since it has no flow_monitor of its own.

Each box also has a **pods** line for the pods scheduled on its node
(outside `POD_NAMESPACE_EXCLUDE`), listed by the same poller: how many
there are, how many aren't ready, and how many belong to a TSN app (pods
labelled `tsn.dev/cr-name`). Hover over it for each pod's phase, restarts
and waiting reason (e.g. `CrashLoopBackOff`).

A zone's own link (its access link when a switch serves it, otherwise the
dashed line to the HPC) shows live traffic from its flow_monitor:

- **Colour:** whichever protocol carries the most bytes.
- **Width:** grows with total throughput on a log scale, from 2px at
  1 kbps or less, 1px per decade, up to 8px at 1 Gbps.
- **Label:** the throughput.

Only a zone's own link is annotated. Switch-to-switch cables aren't,
because flow_monitor doesn't say which path traffic takes through the
fabric.

The HPC box also has an **operator status** line for the sdv-operator
([sdv-operator.py](sdv-operator.py)), which applies the `tsn.dev` resources
to the TSN switches. The operator has no health endpoint, so
`operator_poll_thread` in `dashboard_server.py` reads its Deployment
(`OPERATOR_DEPLOYMENT_NAME` in `OPERATOR_NAMESPACE`, `sdv-operator` in
`default` by default) every `K8S_POLL_INTERVAL_S`. The line shows "Operator
online" when all desired replicas are ready. Otherwise it shows "Operator
offline (ready/desired ready)", or "Operator: not deployed" if the
Deployment doesn't exist. "Online" means the operator's pod is up and
passing readiness checks, not that it is currently working on any
particular resource. What the operator did with each resource is shown per
resource in the custom resources view instead (see below).

If the `kubernetes` package isn't installed or no cluster is reachable
(e.g. running `dashboard_server.py` standalone outside the cluster), the
pollers are skipped and the boxes fall back to a "K8s node metrics: not
connected" placeholder — everything else keeps working.

## Custom resources view

The dashboard also polls the cluster for `CustomResourceDefinition`s and
renders them in a "Custom Resources" panel below the topology view — one
card per CRD, showing its established status, scope, and a table of its
currently active instances (name, namespace, age). This is driven by
`k8s_crd_poll_thread` in `dashboard_server.py`, which runs on its own
`CRD_POLL_INTERVAL_S` (20s by default, separate from the node poll's
interval since listing every CRD's instances is more API calls). Only CRDs
in the API group named by `CRD_GROUP_FILTER` (`tsn.dev` by default) are
shown — set it to `*` to show every CRD in the cluster instead.

Each resource has a **Status** column showing what the sdv-operator last
reported for it. The operator writes this to the resource's `status.sdv`
(`set_sdv_status` in [sdv-operator.py](sdv-operator.py)):

| State | Meaning |
| --- | --- |
| `Connected` | TSNSwitch: NETCONF session is up |
| `Accepted` | NetworkTopology: loaded |
| `Applied` | TsnFlow: shaping pushed to every hop (the message lists them) |
| `Waiting` | TsnFlow: route can't be resolved yet; the operator retries every 15s |
| `Failed` | The handler failed; the message says why (for a TsnFlow, which hops failed) |

Hover over a status for its message and when it was reported. The column
shows **Pending** when the spec changed after the last report
(`observedGeneration` is behind `metadata.generation`), and **No status** if
the operator never reported. For `status.sdv` to be stored, each CRD's
schema must allow a `status` object with unknown fields, otherwise the API
server silently drops it. [crd/networkTopology-crd.yaml](crd/networkTopology-crd.yaml)
and [crd/tsnflow-crd.yaml](crd/tsnflow-crd.yaml) have this. The TSNSwitch
CRD isn't in this repo and needs the same addition:

```yaml
            status:
              type: object
              x-kubernetes-preserve-unknown-fields: true
```

**TsnFlows** get a wider table:

- **Talker → listeners:** each app with its zone. An app is the Deployment
  labelled `tsn.dev/cr-name=<name>`, and its zone is the first value of that
  Deployment's zone node affinity, read the way the operator's
  `deployment_created` reads it.
- **Shaper and parameters:** CBS bandwidth (Mb/s) and PCP, or the TAS cycle
  time.
- **Switch ports:** where the shaping is applied, i.e. each switch's egress
  port along the path from the talker to each listener, plus the last
  switch's zone-facing port. If the route can't be resolved, this column
  shows why instead.
- **Gate schedule (TAS only):** one cycle of the gate control list, with a
  row per traffic class, filled while that class's gate is open. Gate states
  are read as 802.1Qbv bitmasks (bit *i* = TC*i*): a number, a
  decimal/`0x`/`0b` string, or an 8-digit `0`/`1` string written TC7 first.
  If the entries don't add up to `cycleTime`, that's noted below the
  schedule.

The switch ports come from `resolve_flow` in `dashboard_server.py`, which
mirrors the operator's `_resolve_flow_hops`, so the dashboard shows what the
operator configures. Keep the two in step if either changes. In particular:

- **Zone names must match exactly.** The app's zone value (e.g. `p1`) must
  equal a NetworkTopology node's `zone` (e.g. `zone1`), or the flow shows
  "No switch path found". The unresolved message lists the zones the
  NetworkTopology does have.
- **Links are followed one way.** Only links declared on the sending switch
  count, so a cable must be listed on both switches for flows in both
  directions.

On the vehicle topology, each resolved hop is marked on its switch:

- The port's label turns purple.
- The shaper (e.g. `CBS 20M`, `TAS 1 ms`) is tagged beside the link.
- The switch marker gets a purple edge.

Hover over the tag or the marker for the TsnFlow and its parameters.

The panel header has a ring that counts down to the next poll. Next to it,
a **Refresh now** button starts a poll immediately instead of waiting for
the interval. It calls `POST /api/crds/refresh`, which returns `503` when
CRD polling isn't running (no reachable cluster).

Instances of the `NetworkTopology` CRD (schema in
[crd/networkTopology-crd.yaml](crd/networkTopology-crd.yaml)) are also drawn
as a switch graph in the vehicle topology view:

- Each `spec.nodes[]` entry is a switch marker (`switchRef` / `id`). A
  switch with a `zone` is matched to a zone box by the number in that field
  (e.g. `"zone1"` → `zone-1`), placed between that zone and the middle of
  the car, and wired to the zone box by an access link labelled with its
  workload-facing `port`. That zone's direct dashed connector to the HPC is
  hidden, and its traffic-protocol colour moves onto the access link.
- Every zone a switch serves gets a regular zone box, whether or not it
  has any physical device (a `TOPOLOGY` entry), and a zone the resource
  newly describes re-lays out the view on the next poll. Add the zone to
  `TOPOLOGY` once it has a flow_monitor and/or a Kubernetes node, to get
  live state for it.
- A switch whose `zone` is the Vehicle Computer's (`"zone3"`) is the core
  switch: it sits directly above the HPC box and is wired down to it.
- Each `links[]` entry is a physical cable to another switch in the same
  resource, labelled with the local port at each end. When both ends list
  the same cable, the two entries are merged into one link.
- Cables between a zonal switch and the core switch are drawn like a wiring
  diagram: top-row switches run across and drop into the core's top edge;
  bottom-row switches run to a channel beside the HPC box, climb, and enter
  the core from the side. When several come in on the same side they nest,
  innermost column innermost, so they never cross.
- A switch without a `zone` is a transit switch (dashed marker), placed in
  a free slot near the switches it links. Any cable that isn't zonal-to-core
  is a straight line, bowed around the HPC box if it would cross it, with
  parallel cables fanned apart.
- Switches whose links name a switch `id` that doesn't exist get a
  warning-coloured border, and the problem is spelled out in the marker's
  tooltip.

Like the node poller, this is skipped if the `kubernetes` package isn't
installed or no cluster is reachable, and the panel falls back to an empty
state rather than blocking the rest of the dashboard.

## Events

The **Events** panel is a timeline of changes the server has seen since it
started, newest first:

- A flow_monitor going live, stale or down.
- A zone or HPC node becoming Ready or Not Ready, or disappearing.
- The sdv-operator going online or offline.
- Custom resources being created or deleted.
- A change in the `status.sdv` state the operator reports.

Nothing is logged for the initial state at startup, only for changes after
it. The server keeps the last `EVENT_LOG_LEN` (200) events in memory, so
the log starts empty after a restart.

## Device panels

Each flow_monitor gets a panel with its current totals, a throughput
chart, the protocol breakdown and its flows:

- **Chart range:** **5 min** plots every snapshot (the last `HISTORY_LEN`
  points). **15 min** and **1 h** plot 10-second averages
  (`LONG_HISTORY_BUCKET_S`, keeping `LONG_HISTORY_LEN` buckets = 1 h), with
  a lighter line for each bucket's peak, since averages hide bursts.
  **Export CSV** exports whatever the chart currently shows, including the
  peaks for the longer ranges.
- **Flows table:** click a column header to sort by it, and click again to
  reverse. The filter box keeps flows whose endpoints or protocol contain
  every word typed, e.g. `tcp 192.168.1.10` or `:443`. Up to 20 rows are
  shown.

History is kept in memory, so a server restart clears it. **Reset
statistics** clears both histories for that device.

## HTTP endpoints

| Endpoint | Purpose |
| --- | --- |
| `GET /` | The dashboard page |
| `GET /api/state` | Full current state as JSON |
| `GET /events` | Server-Sent Events stream of every update |
| `GET /healthz` | `200` while every background thread (ZMQ receivers, watchdog, pollers) is running, `503` with `dead_threads` otherwise; used by the Kubernetes probes |
| `POST /api/reset/<device_id>` | Clear a device's history |
| `POST /api/crds/refresh` | Poll custom resources now |

## Running

**Web dashboard:**

```bash
python3 dashboard_server.py
```

Then open `http://localhost:8765/`.

**Terminal viewer:**

```bash
python3 subscriber.py
```

## Docker

A `Dockerfile` is provided for the web dashboard:

```bash
docker build -t data-visualizer .
docker run -p 8765:8765 data-visualizer
```

To use your own devices/topology, mount a config file and point
`DASHBOARD_CONFIG` at it (see [Configuration](#configuration)):

```bash
docker run -p 8765:8765 -v $PWD/my-config.json:/etc/flow-dashboard/config.json:ro \
  -e DASHBOARD_CONFIG=/etc/flow-dashboard/config.json data-visualizer
```

The container needs network access to the device endpoints (e.g. same host
network or a reachable IP/hostname).

## Kubernetes

[deployments/dashboard.yaml](deployments/dashboard.yaml) deploys the
dashboard onto the testbed's Kubernetes cluster as the central HPC node in
the vehicle topology it renders — see the comments at the top of that file
for build/load and `kubectl apply` steps.

**Configuration.** Devices and topology come from the
`flow-dashboard-config` ConfigMap, mounted at
`/etc/flow-dashboard/config.json` and passed as `DASHBOARD_CONFIG`. The
file is read at startup, so after editing it, re-apply and run
`kubectl rollout restart deployment/flow-dashboard`. The readiness and
liveness probes use `/healthz`.

**Permissions.** The manifest creates a `flow-dashboard` `ServiceAccount`
bound to three `ClusterRole`s. All of them are read-only
(`get`/`list`/`watch`):

- **`flow-dashboard-node-reader`:** `Node` objects, for the live node state
  in the vehicle topology view.
- **`flow-dashboard-crd-reader`:** `CustomResourceDefinition`s cluster-wide
  plus resources in the `tsn.dev` API group, for the custom resources view.
- **`flow-dashboard-workload-reader`:** pods and Deployments in all
  namespaces. It covers the pods in each zone box, the HPC box's operator
  status, and the Deployments labelled `tsn.dev/cr-name` that place each
  TsnFlow talker/listener in a zone.

This last role replaces the namespaced `flow-dashboard-operator-reader`
`Role`. `kubectl apply` doesn't remove the old one; delete it with
`kubectl delete role,rolebinding flow-dashboard-operator-reader`.

If you widen `CRD_GROUP_FILTER` to cover more groups (or `*`, for all of
them), update the `flow-dashboard-crd-reader` `ClusterRole` to match.
`dashboard_server.py` picks all of this up automatically via
`kubernetes.config.load_incluster_config()`; no extra setup is needed beyond
applying the manifest.
