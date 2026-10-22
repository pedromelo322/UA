import kopf
import logging
from datetime import datetime, timezone
from ncclient import manager
import configparser
from collections import deque
from kubernetes import client, config
from kubernetes.client.rest import ApiException

frer = """
<frer xmlns="urn:ieee:std:802.1Q:yang:ieee802-dot1cb-frer">

  <!-- Sequence Generation -->
  <sequence-generation>
    <index>1</index>
    <stream>1</stream>
    <direction-out-facing>true</direction-out-facing>
    <reset>false</reset>
  </sequence-generation>

  <!-- Sequence Identification on output ports -->
  <sequence-identification>
    <stream>1</stream>
    <port>PORT_1</port>
    <direction-out-facing>true</direction-out-facing>
    <active>true</active>

    <encapsulation>
      <r-tag/>
    </encapsulation>
  </sequence-identification>

  <sequence-identification>
    <stream>1</stream>
    <port>PORT_3</port>
    <direction-out-facing>true</direction-out-facing>
    <active>true</active>

    <encapsulation>
      <r-tag/>
    </encapsulation>
  </sequence-identification>

  <!-- Stream Replication -->
  <stream-split>
    <port>PORT_0</port>
    <direction-out-facing>true</direction-out-facing>

    <input-id>1</input-id>

    <output-id>1</output-id>
    <output-id>2</output-id>
  </stream-split>

</frer>

"""

aa = """
<config xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
  <interfaces xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces">
    <interface>
      <name>PORT_0</name>
      <bridge-port xmlns="urn:ieee:std:802.1Q:yang:ieee802-dot1q-bridge">
        <gate-parameter-table xmlns="urn:ieee:std:802.1Q:yang:ieee802-dot1q-sched">
          <gate-enabled>true</gate-enabled>
          <admin-control-list>
            <gate-control-entry>
              <index>0</index>
              <gate-states-value>249</gate-states-value>
              <operation-name>set-gate-states</operation-name>
              <time-interval-value>15000000</time-interval-value>
            </gate-control-entry>
            <gate-control-entry>
                          <index>1</index>
                      <gate-states-value>6</gate-states-value>
                          <operation-name>set-gate-states</operation-name>
                          <time-interval-value>5000000</time-interval-value>
                        </gate-control-entry>
          </admin-control-list>
          <admin-cycle-time>
            <numerator>20000000</numerator>
            <denominator>1000000000</denominator>
          </admin-cycle-time>
          <config-change>true</config-change>
        </gate-parameter-table>
      </bridge-port>
    </interface>
  </interfaces>
</config>
"""

cbs_test = """
<config xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">

  <ieee8021FqtssMappings xmlns="urn:ieee:std:802.1:yang:ieee802-dot1-fqtss-cbs">
    <ieee8021FqtssTxSelectionAlgorithmEntry>
      <port>PORT_3</port>
      <ieee8021FqtssTrafficClass>3</ieee8021FqtssTrafficClass>
      <ieee8021FqtssTxSelectionAlgorithmID>1</ieee8021FqtssTxSelectionAlgorithmID>
    </ieee8021FqtssTxSelectionAlgorithmEntry>
  </ieee8021FqtssMappings>

  <ieee8021FqtssBap xmlns="urn:ieee:std:802.1:yang:ieee802-dot1-fqtss-cbs">
    <ieee8021FqtssBapEntry>
      <port>PORT_3</port>
      <ieee8021FqtssBAPTrafficClass>3</ieee8021FqtssBAPTrafficClass>

      <ieee8021FqtssDeltaBandwidth>20000000</ieee8021FqtssDeltaBandwidth>

      <ieee8021FqtssAdminIdleSlopeMs>0</ieee8021FqtssAdminIdleSlopeMs>
      <ieee8021FqtssAdminIdleSlopeLs>20000000</ieee8021FqtssAdminIdleSlopeLs>

    </ieee8021FqtssBapEntry>
  </ieee8021FqtssBap>

</config>
"""

# dict of credentials of switches in the cluster
tsnSwitches = {}
# dict of the current netconf session
netconf_sessions = {}
# dict of deployments by zone
depByZone = {}
# dict of the network topology
topology = {}

#netConfig = {}

    
# def readConfig(path):
#     global netConfig
#     config = configparser.ConfigParser()
#     config.read(path)
#     netConfig['host'] = config['CREDENTIALS']["host"]
#     netConfig['port'] = config['CREDENTIALS']["port"]
#     netConfig['username'] = config['CREDENTIALS']["username"]
#     netConfig['password'] = config['CREDENTIALS']["password"]

def get_session(swid):
    #global netconf_session
    
    if swid not in netconf_sessions:
        logging.warning("Netconf session not recognized!")
        return

    if not netconf_sessions[swid].connected:
        logging.warning("Reconnecting NETCONF session...")
        netconf_sessions[swid] = manager.connect(
            host=netconf_sessions[swid]['host'],
            port=int(netconf_sessions[swid]['port']),
            username=netconf_sessions[swid]['username'],
            password=netconf_sessions[swid]['password'],
            hostkey_verify=False
        )

    return netconf_sessions[swid]

def end_session(swid=None):
    # end session for all switches
    if swid == None:
        for session in netconf_sessions:
            logging.warning("Disconnecting NETCONF session...")
            netconf_sessions[session].close_session()
            netconf_sessions.pop[session]
    else: # end session for only one switch
        logging.warning("Disconnecting NETCONF session...")
        netconf_sessions[swid].close_session()
        netconf_sessions.pop(swid)

def send_config(netconf_config, swid):
    try:
        get_session(swid).edit_config(target="running", config=netconf_config)
        logging.info("NETCONF config applied successfully.")
        return True
    except Exception:
        logging.error("NETCONF config failed.")
        return False
    

def deleteConfCbs(cbs, swInterface, swid):
    pcp = cbs["pcp"]
    delete_conf_cbs = f"""
        <config xmlns="urn:ietf:params:xml:ns:netconf:base:1.0" xmlns:nc="urn:ietf:params:xml:ns:netconf:base:1.0">
    
        <ieee8021FqtssMappings xmlns="urn:ieee:std:802.1:yang:ieee802-dot1-fqtss-cbs">
            <ieee8021FqtssTxSelectionAlgorithmEntry nc:operation="delete">
            <port>{swInterface}</port>
            <ieee8021FqtssTrafficClass>{pcp}</ieee8021FqtssTrafficClass>
            </ieee8021FqtssTxSelectionAlgorithmEntry>
        </ieee8021FqtssMappings>

        <ieee8021FqtssBap xmlns="urn:ieee:std:802.1:yang:ieee802-dot1-fqtss-cbs">
            <ieee8021FqtssBapEntry nc:operation="delete">
            <port>{swInterface}</port>
            <ieee8021FqtssBAPTrafficClass>{pcp}</ieee8021FqtssBAPTrafficClass>
            </ieee8021FqtssBapEntry>
        </ieee8021FqtssBap>
        
        </config>
    """
    return send_config(delete_conf_cbs, swid)

def deleteConfTas(swInterface, swid):
    netconf_config_tas_delete = f"""
        <config xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
            <interfaces xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces">
                <interface>
                <name>{swInterface}</name>
                <bridge-port xmlns="urn:ieee:std:802.1Q:yang:ieee802-dot1q-bridge">
                    <gate-parameter-table xmlns="urn:ieee:std:802.1Q:yang:ieee802-dot1q-sched">
                    <gate-enabled>false</gate-enabled>
                    <config-change>true</config-change>
                    </gate-parameter-table>
                </bridge-port>
                </interface>
            </interfaces>
            </config>
        """
    return send_config(netconf_config_tas_delete, swid)

def executeConfCbs(cbs, swInterface, swid):
    bandwidth = cbs["bandwidth"]
    pcp = cbs["pcp"]
    
    netconf_config_cbs = f"""
       <config xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
        <ieee8021FqtssMappings xmlns="urn:ieee:std:802.1:yang:ieee802-dot1-fqtss-cbs">
            <ieee8021FqtssTxSelectionAlgorithmEntry>
            <port>{swInterface}</port>
            <ieee8021FqtssTrafficClass>{pcp}</ieee8021FqtssTrafficClass>
            <ieee8021FqtssTxSelectionAlgorithmID>1</ieee8021FqtssTxSelectionAlgorithmID>
            </ieee8021FqtssTxSelectionAlgorithmEntry>
        </ieee8021FqtssMappings>

        <ieee8021FqtssBap xmlns="urn:ieee:std:802.1:yang:ieee802-dot1-fqtss-cbs">
            <ieee8021FqtssBapEntry>
            <port>{swInterface}</port>
            <ieee8021FqtssBAPTrafficClass>{pcp}</ieee8021FqtssBAPTrafficClass>
            
            <ieee8021FqtssAdminIdleSlopeMs>0</ieee8021FqtssAdminIdleSlopeMs>
            <ieee8021FqtssAdminIdleSlopeLs>{bandwidth*1000000}</ieee8021FqtssAdminIdleSlopeLs>
            </ieee8021FqtssBapEntry>
        </ieee8021FqtssBap>
        </config>
    """
    
    return send_config(netconf_config_cbs, swid)


def executeConfTas(tas, swInterface, swid):
    cycleTime = tas["cycleTime"]
    gcl = tas["gateControlList"]
    
    acl = ""
    
    for gateEntry in gcl:
        acl += (f"""
                    <gate-control-entry>
                    <index>{gateEntry["index"]}</index>
                    <gate-states-value>{gateEntry["gateState"]}</gate-states-value>
                    <operation-name>set-gate-states</operation-name>
                    <time-interval-value>{gateEntry["timeInterval"]}</time-interval-value>
                    </gate-control-entry>
                    """)
  
    netconf_config_tas = f"""
        <config xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
        <interfaces xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces">
            <interface>
            <name>{swInterface}</name>
            <bridge-port xmlns="urn:ieee:std:802.1Q:yang:ieee802-dot1q-bridge">
                <gate-parameter-table xmlns="urn:ieee:std:802.1Q:yang:ieee802-dot1q-sched">
                <gate-enabled>true</gate-enabled>
                <admin-control-list>
                    {acl}
                </admin-control-list>
                <admin-cycle-time>
                    <numerator>{cycleTime}</numerator>
                    <denominator>1000000000</denominator>
                </admin-cycle-time>
                <config-change>true</config-change>
                </gate-parameter-table>
            </bridge-port>
            </interface>
        </interfaces>
        </config>
        """
        
    return send_config(netconf_config_tas, swid)

###### status reporting

# Handlers record what they did in the resource's status.sdv, which the
# dashboard shows per resource (and logs to its event timeline on change):
#   state: Connected / Accepted / Applied / Waiting / Failed
#   message: human-readable detail
#   observedGeneration: metadata.generation this status describes, so a
#     spec edit the operator hasn't handled yet shows up as pending
#   lastUpdate: when it was written
# kopf applies `patch` at the end of the handler's processing cycle even if
# the handler raises, so a Waiting/Failed status still lands before the
# retry. The CRDs need a `status` schema that keeps unknown fields (see
# crd/networkTopology-crd.yaml), or the API server prunes this.
def set_sdv_status(patch, meta, state, message):
    patch.status["sdv"] = {
        "state": state,
        "message": message,
        "observedGeneration": meta.get("generation"),
        "lastUpdate": datetime.now(timezone.utc).isoformat(timespec="seconds"),
    }

###### deployments

# on.resume too: depByZone lives in memory, and kopf doesn't re-run on.create
# for Deployments it already handled before an operator restart.
@kopf.on.resume('apps', 'v1', 'deployments')
@kopf.on.create('apps', 'v1', 'deployments')
def deployment_created(body, logger, **kwargs):
    #logging.info(f"Got event {event['type']} for deployment {body['metadata']['name']}")

    deployment = body
    cr_name = deployment['metadata'].get('labels', {}).get('tsn.dev/cr-name')
    if not cr_name:
        return  # not a deployment managed by this operator

    affinity = deployment["spec"]["template"]["spec"].get("affinity")
    if not affinity:
        logger.warning(f"Deployment for cr_name {cr_name} has no affinity set, skipping.")
        return

    zones = (
        affinity.get("nodeAffinity", {})
        .get("requiredDuringSchedulingIgnoredDuringExecution", {})
        .get("nodeSelectorTerms", [{}])[0]
        .get("matchExpressions", [{}])[0]
        .get("values")
    )
    depByZone[cr_name] = zones
    logging.info(f"Deployment with cr_name: {cr_name} added to zones: {zones}")


@kopf.on.delete('apps', 'v1', 'deployments')
def deployment_deleted(body, logger, **kwargs):
    #logging.info(f"Got event {event['type']} for deployment {body['metadata']['name']}")
    deployment = body
    if deployment['metadata']['name'] == 'sdv-operator':
        # do not manage itself
        return

    cr_name = deployment['metadata'].get('labels', {}).get('tsn.dev/cr-name')

    if not cr_name:
        logging.info("No Custom Resource associated detected!")
        return  # not a deployment managed by this operator

    affinity = deployment["spec"]["template"]["spec"].get("affinity")
    zones = None
    if affinity:
        zones = (
            affinity.get("nodeAffinity", {})
            .get("requiredDuringSchedulingIgnoredDuringExecution", {})
            .get("nodeSelectorTerms", [{}])[0]
            .get("matchExpressions", [{}])[0]
            .get("values")
        )

    if cr_name in depByZone:
        depByZone.pop(cr_name)
        logging.info(f"Deployment with cr_name: {cr_name} from zones: {zones} deleted!")

    namespace = deployment['metadata']['namespace']

    logging.info(f"Deleting CR {cr_name} because its deployment was removed.")

    api = client.CustomObjectsApi()
    try:
        api.delete_namespaced_custom_object(
            group="tsn.dev",
            version="v1",
            namespace=namespace,
            plural="tsnapps",
            name=cr_name,
        )
    except ApiException as e:
        if e.status == 404:
            logging.info(f"CR {cr_name} already gone, nothing to delete.")
        else:
            raise

###### tsnswitch ##############################################################################################################################################################################

@kopf.on.create('tsnswitch')
def create_fn(spec, name, namespace, logger, patch, meta, **kwargs):
    pass
    swid = spec.get("id")
    tsnSwitches[swid] = spec
    
    try:
        netconf_sessions[swid] = manager.connect(
            host=spec['host'],
            port=int(spec['port']),
            username=spec['username'],
            password=spec['password'],
            hostkey_verify=False
        )
    except Exception as e:
        set_sdv_status(patch, meta, "Failed", f"NETCONF connection to {spec.get('host')} failed: {e}")
        raise
    #readConfig("config.conf")
    #print(netconf_sessions)
    set_sdv_status(patch, meta, "Connected", f"NETCONF session established with {spec.get('host')}")
    logging.info(f"NETCONF session established with host: {spec.get("host")}")
    
@kopf.on.update('tsnswitch')
def update_fn(spec, old, new, diff, patch, meta, **_):
    pass
    swid = spec.get("id")
    
    if swid in tsnSwitches:
        tsnSwitches[swid] = spec
        try:
            end_session(swid)
            netconf_sessions[swid] = manager.connect(
                host=spec['host'],
                port=int(spec['port']),
                username=spec['username'],
                password=spec['password'],
                hostkey_verify=False
            )
        except Exception as e:
            set_sdv_status(patch, meta, "Failed", f"NETCONF reconnection to {spec.get('host')} failed: {e}")
            raise
        set_sdv_status(patch, meta, "Connected", f"NETCONF session re-established with {spec.get('host')}")
        logging.info(f"NETCONF session updated with host: {spec.get("host")}")
        
@kopf.on.delete('tsnswitch')
def delete_fn(spec, **_):
    pass
    swid = spec.get("id")
    
    if swid in tsnSwitches:
        tsnSwitches.pop(swid)
        end_session(swid)
        logging.info(f"NETCONF session disconnected with host: {spec.get("host")}")

###### networktopology

@kopf.on.create('networktopology')
def create_fn(spec, name, namespace, logger, patch, meta, **kwargs):
    nodes = spec.get("nodes")
    for node in nodes:
        topology[node["id"]] = node
        
    set_sdv_status(patch, meta, "Accepted", f"Topology with {len(nodes)} switch(es) loaded")
    logging.info(f"Added network topology: {topology}")

    
@kopf.on.update('networktopology')
def update_fn(spec, old, new, diff, patch, meta, **_):
    nodes = spec.get("nodes")
    topology.clear() # clear dict first
    for node in nodes:
        topology[node["id"]] = node
        
    set_sdv_status(patch, meta, "Accepted", f"Topology with {len(nodes)} switch(es) loaded")
    logging.info(f"Updated network topology: {topology}")
        
@kopf.on.delete('networktopology')
def delete_fn(spec, **_):
    topology.clear() # clear dict first
    logging.info("Deleted network topology!")


###### tsnapps

@kopf.on.create('tsnapps')
def create_fn(spec, name, namespace, logger, **kwargs):
    logging.info(f"Detected a TSN APP creation for: {spec.get("shaper")}")
    pass
    # shaper = spec.get("shaper")
    # if shaper == "CBS":
    #     executeConfCbs(spec.get("cbs"), spec.get("swInterface"))
    # elif shaper == "TAS":
    #     executeConfTas(spec.get("tas"), spec.get("swInterface"))
    # else:
    #     logging.warning(f"I don't have that Shaper: {shaper}")
    
@kopf.on.update('tsnapps')
def update_fn(spec, old, new, diff, **_):
    logging.info(f"Detected a TSN APP update for: {spec.get("shaper")}")
    pass
    # shaper = spec.get("shaper")
    # if shaper == "CBS":
    #     executeConfCbs(spec.get("cbs"), spec.get("swInterface"))
    # elif shaper == "TAS":
    #     executeConfTas(spec.get("tas"), spec.get("swInterface"))
    # else:
    #     logging.warning(f"I don't have that Shaper: {shaper}")

@kopf.on.delete('tsnapps')
def delete_fn(spec, **_):
    logging.info(f"Detected a TSN APP deletion for: {spec.get("shaper")}")
    pass
    # logging.info(f"A handler is deleted with spec: {spec}")
    # shaper = spec.get("shaper")
    # if shaper == "CBS":
    #     deleteConfCbs(spec.get("cbs"), spec.get("swInterface"))
    # elif shaper == "TAS":
    #     deleteConfTas(spec.get("swInterface"))
    # else:
    #     logging.warning(f"I don't have that Shaper: {shaper}")

###### tsnflow — cross-zone flow routing ######################################################################################################################################################
# NEW: everything below, plus the `swid` parameter added to
# executeConfCbs/executeConfTas/deleteConfCbs/deleteConfTas above, is
# the TsnFlow feature. A TsnFlow names a talker and one or more
# listeners (by their TsnApp cr-name) and gets its shaping profile
# pushed to every switch hop the operator resolves between them via
# NetworkTopology.spec.nodes[].links — not just the talker's and
# listener's own zonal switches.
#
# NOTE: depByZone is keyed by the zone value from the Deployment's
# nodeAffinity (the `topology.kubernetes.io/zone` node label, e.g.
# "p1"), while NetworkTopology.spec.nodes[].zone currently uses a
# different naming ("zone1"). These must match for _node_for_zone()
# to find anything — align one to the other before relying on this.

def _zone_of_app(cr_name):
    zones = depByZone.get(cr_name)
    if not zones:
        return None
    return zones[0]  # a Deployment is pinned to a single zone in practice

def _node_for_zone(zone):
    for node in topology.values():
        if node.get("zone") == zone:
            return node["id"]
    return None

def _topology_graph():
    return {
        node["id"]: [(link["target"], link["port"]) for link in node.get("links", [])]
        for node in topology.values()
    }

def _resolve_path(src_zone, dst_zone):
    src, dst = _node_for_zone(src_zone), _node_for_zone(dst_zone)
    if src is None or dst is None:
        return None
    if src == dst:
        return [src]

    graph = _topology_graph()
    visited = {src}
    queue = deque([[src]])
    while queue:
        path = queue.popleft()
        for target, _port in graph.get(path[-1], []):
            if target == dst:
                return path + [target]
            if target not in visited:
                visited.add(target)
                queue.append(path + [target])
    return None

def _egress_hops(path):
    # (swid, swInterface) pairs to configure: each switch's outbound
    # port along the path, ending with the last switch's zone-facing
    # port (where the listener actually receives the traffic).
    graph = _topology_graph()
    hops = []
    for a, b in zip(path, path[1:]):
        port = next((p for target, p in graph.get(a, []) if target == b), None)
        if port is None:
            return None
        hops.append((topology[a]["switchRef"], port))
    last = path[-1]
    hops.append((topology[last]["switchRef"], topology[last]["port"]))
    return hops

def _resolve_flow_hops(spec):
    talker_zone = _zone_of_app(spec["talker"])
    if talker_zone is None:
        raise kopf.TemporaryError(f"Talker {spec['talker']} not scheduled to a zone yet.", delay=15)

    hops = {}  # dict-as-ordered-set: dedupes hops shared by multiple listeners
    for listener_cr in spec["listeners"]:
        listener_zone = _zone_of_app(listener_cr)
        if listener_zone is None:
            raise kopf.TemporaryError(f"Listener {listener_cr} not scheduled to a zone yet.", delay=15)

        path = _resolve_path(talker_zone, listener_zone)
        if path is None:
            raise kopf.TemporaryError(
                f"No switch path found between zones {talker_zone} and {listener_zone}.", delay=15
            )

        listener_hops = _egress_hops(path)
        if listener_hops is None:
            raise kopf.TemporaryError("Topology link missing a port for a hop on the resolved path.", delay=15)

        for hop in listener_hops:
            hops[hop] = True

    return list(hops.keys())

@kopf.on.create('tsnflow')
@kopf.on.update('tsnflow')
def tsnflow_apply(spec, name, patch, meta, **_):
    try:
        hops = _resolve_flow_hops(spec)
    except kopf.TemporaryError as e:
        set_sdv_status(patch, meta, "Waiting", str(e))
        raise
    shaper = spec.get("shaper")
    failed = []
    for swid, swInterface in hops:
        if shaper == "CBS":
            ok = executeConfCbs(spec.get("cbs"), swInterface, swid)
        elif shaper == "TAS":
            ok = executeConfTas(spec.get("tas"), swInterface, swid)
        else:
            logging.warning(f"I don't have that Shaper: {shaper}")
            ok = False
        if not ok:
            failed.append(f"{swid} {swInterface}")
    hop_list = ", ".join(f"{swid} {swInterface}" for swid, swInterface in hops)
    # What tsnflow_delete undoes: the hops actually configured, recorded
    # here because resolving them again at delete time needs the talker's
    # and listeners' zones, which are gone once their Deployments are
    # deleted (or after an operator restart).
    patch.status["appliedHops"] = [{"switch": swid, "port": swInterface} for swid, swInterface in hops
                                   if f"{swid} {swInterface}" not in failed]
    if failed:
        set_sdv_status(patch, meta, "Failed",
                       f"{shaper} config failed on {len(failed)} of {len(hops)} hop(s): {', '.join(failed)}")
    else:
        set_sdv_status(patch, meta, "Applied", f"{shaper} applied to {len(hops)} hop(s): {hop_list}")
    logging.info(f"TsnFlow {name} applied to hops: {hops}")

@kopf.on.delete('tsnflow')
def tsnflow_delete(spec, status, name, **_):
    applied = status.get("appliedHops")
    if applied is not None:
        hops = [(hop["switch"], hop["port"]) for hop in applied]
    else:
        # No record (never applied, or applied before appliedHops existed):
        # resolve the route if we still can. If we can't, it was never
        # confirmed applied, so there's nothing known to undo -- let the
        # deletion finish rather than retry forever.
        try:
            hops = _resolve_flow_hops(spec)
        except kopf.TemporaryError as e:
            logging.warning(f"TsnFlow {name}: no applied hops recorded and route unresolvable ({e}); "
                            f"nothing to remove from the switches.")
            return
    shaper = spec.get("shaper")
    for swid, swInterface in hops:
        if shaper == "CBS":
            deleteConfCbs(spec.get("cbs"), swInterface, swid)
        elif shaper == "TAS":
            deleteConfTas(swInterface, swid)
        else:
            logging.warning(f"I don't have that Shaper: {shaper}")
    logging.info(f"TsnFlow {name} removed from hops: {hops}")

###### end tsnflow ##############################################################################################################################################################################

@kopf.on.cleanup()
def shutdown_fn(**kwargs):
    logging.info("Time to cleanup")
    # global netconf_session
    # if netconf_session:
    #     netconf_session.close_session()
    #     logging.info("NETCONF session closed.")
    end_session()
    logging.info("NETCONF sessions closed.")

@kopf.on.startup()
def configure(settings: kopf.OperatorSettings, **kwargs):
    logging.info("Operator started.")
    