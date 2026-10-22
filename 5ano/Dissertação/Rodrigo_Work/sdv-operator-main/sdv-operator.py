import kopf
import logging
from ncclient import manager
import configparser
from kubernetes import client, config

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
    

def deleteConfCbs(cbs, swInterface):
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
    result = send_config(delete_conf_cbs, swid)
    if not result:
        pass

def deleteConfTas(swInterface):
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
    result = send_config(netconf_config_tas_delete)
    if not result:
        pass

def executeConfCbs(cbs, swInterface):
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
    
    result = send_config(netconf_config_cbs)
    if not result:
        pass


def executeConfTas(tas, swInterface):
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
        
    result = send_config(netconf_config_tas)
    if not result:
        pass

###### deployments

@kopf.on.create('apps', 'v1', 'deployments')
def deployment_created(body, logger, **kwargs):
    #logging.info(f"Got event {event['type']} for deployment {body['metadata']['name']}")
    
    deployment = body
    cr_name = deployment['metadata']['labels'].get('tsn.dev/cr-name')
    #tag = deployment['metadata']['labels'].get('tag')
    
    #print(deployment["spec"]["template"]["spec"]["affinity"]["nodeAffinity"]["requiredDuringSchedulingIgnoredDuringExecution"]["nodeSelectorTerms"][0]["matchExpressions"][0]["values"])
    zones = deployment["spec"]["template"]["spec"]["affinity"]["nodeAffinity"]["requiredDuringSchedulingIgnoredDuringExecution"]["nodeSelectorTerms"][0]["matchExpressions"][0].get("values")
    depByZone[cr_name] = zones
    logging.info(f"Deployment with cr_name: {cr_name} added to zones: {zones}")
    

@kopf.on.delete('apps', 'v1', 'deployments')
def deployment_deleted(body, logger, **kwargs):
    #logging.info(f"Got event {event['type']} for deployment {body['metadata']['name']}")
    deployment = body
    cr_name = deployment['metadata']['labels'].get('tsn.dev/cr-name')
    #tag = deployment['metadata']['labels'].get('tag')
    
    #print(deployment["spec"]["template"]["spec"]["affinity"]["nodeAffinity"]["requiredDuringSchedulingIgnoredDuringExecution"]["nodeSelectorTerms"][0]["matchExpressions"][0]["values"])
    zones = deployment["spec"]["template"]["spec"]["affinity"]["nodeAffinity"]["requiredDuringSchedulingIgnoredDuringExecution"]["nodeSelectorTerms"][0]["matchExpressions"][0].get("values")
    if cr_name in depByZone:
        depByZone.pop(cr_name)
        logging.info(f"Deployment with cr_name: {cr_name} from zones: {zones} deleted!")
    
    if cr_name:
        namespace = deployment['metadata']['namespace']

        logging.info(f"Deleting CR {cr_name} because its deployment was removed.")

        api = client.CustomObjectsApi()
        api.delete_namespaced_custom_object(
            group="tsn.dev",
            version="v1",
            namespace=namespace,
            plural="tsnapps",
            name=cr_name,
        )
    else:
        logging.info("No Custom Resource associated detected!")

###### tsnswitch

@kopf.on.create('tsnswitch')
def create_fn(spec, name, namespace, logger, **kwargs):
    swid = spec.get("id")
    tsnSwitches[swid] = spec
    
    netconf_sessions[swid] = manager.connect(
        host=spec['host'],
        port=int(spec['port']),
        username=spec['username'],
        password=spec['password'],
        hostkey_verify=False
    )
    #readConfig("config.conf")
    #print(netconf_sessions)
    logging.info(f"NETCONF session established with host: {spec.get("host")}")
    
@kopf.on.update('tsnswitch')
def update_fn(spec, old, new, diff, **_):
    swid = spec.get("id")
    
    if swid in tsnSwitches:
        tsnSwitches[swid] = spec
        end_session(swid)
        netconf_sessions[swid] = manager.connect(
            host=tsnSwitches['host'],
            port=int(tsnSwitches['port']),
            username=tsnSwitches['username'],
            password=tsnSwitches['password'],
            hostkey_verify=False
        )
        logging.info(f"NETCONF session updated with host: {spec.get("host")}")
        
@kopf.on.delete('tsnswitch')
def delete_fn(spec, **_):
    swid = spec.get("id")
    
    if swid in tsnSwitches:
        tsnSwitches.pop(swid)
        end_session(swid)
        logging.info(f"NETCONF session disconnected with host: {spec.get("host")}")

###### networktopology

@kopf.on.create('networktopology')
def create_fn(spec, name, namespace, logger, **kwargs):
    nodes = spec.get("nodes")
    for node in nodes:
        topology[node["id"]] = node
        
    logging.info(f"Added network topology: {topology}")

    
@kopf.on.update('networktopology')
def update_fn(spec, old, new, diff, **_):
    nodes = spec.get("nodes")
    topology.clear() # clear dict first
    for node in nodes:
        topology[node["id"]] = node
        
    logging.info(f"Updated network topology: {topology}")
        
@kopf.on.delete('networktopology')
def delete_fn(spec, **_):
    topology.clear() # clear dict first
    logging.info("Deleted network topology!")
        


###### tsnapps

@kopf.on.create('tsnapps')
def create_fn(spec, name, namespace, logger, **kwargs):
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
    pass
    # logging.info(f"A handler is deleted with spec: {spec}")
    # shaper = spec.get("shaper")
    # if shaper == "CBS":
    #     deleteConfCbs(spec.get("cbs"), spec.get("swInterface"))
    # elif shaper == "TAS":
    #     deleteConfTas(spec.get("swInterface"))
    # else:
    #     logging.warning(f"I don't have that Shaper: {shaper}")

@kopf.on.cleanup()
def shutdown_fn(**kwargs):
    # global netconf_session
    # if netconf_session:
    #     netconf_session.close_session()
    #     logging.info("NETCONF session closed.")
    end_session()
    logging.info("NETCONF session closed.")

@kopf.on.startup()
def configure(settings: kopf.OperatorSettings, **kwargs):
    
    logging.info("Operator started.")
    