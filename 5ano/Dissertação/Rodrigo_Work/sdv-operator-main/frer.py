from ncclient import manager

a = """
<rpc message-id="2" xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
  <get-config>
    <source><running/></source>
    <filter type="subtree">
      <stream-identity xmlns="urn:ieee:std:802.1Q:yang:ieee802-dot1cb-stream-identification"/>
    </filter>
  </get-config>
</rpc>
"""

g = """
<rpc xmlns="urn:ietf:params:xml:ns:netconf:base:1.0" message-id="101">
    <get-config>
        <source>
            <running/>
        </source>
        <!-- Optional: filter to narrow down results -->
        <!--
        <filter type="subtree">
            <interfaces xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces"/>
        </filter>
        -->
    </get-config>
</rpc>
"""

with manager.connect(
        host="10.0.22.176",
        port=830,
        username="sys-admin",
        password="sys-admin",
        hostkey_verify=False) as m:

    filter_xml = """
    <filter xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
        <frer xmlns="urn:ieee:std:802.1Q:yang:ieee802-dot1cb-frer"/>
    </filter>
    """
    with open("examples/qav_config2.xml") as f:
        #config = f.read()
        #print(m.edit_config(target="running", config=config))
        r = m.get()
        print(r.xml)
        #with open("conf.xml", "w") as f:
        #    f.write(r.xml)
        #print(reply)
        
        
    #reply = m.get_config(source="running")

    #with open("conf.xml", "w") as f:
    #    f.write(reply.xml)
        #print(reply)