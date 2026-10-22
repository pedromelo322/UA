# TSN Switch Operator for Kubernetes

A Kubernetes Operator designed to automate **Time-Sensitive Networking (TSN)** configurations on hardware switches. This operator bridges the gap between cloud-native orchestration and hardware-level deterministic networking by translating Custom Resources into NETCONF/YANG configurations.

## Overview

This operator manages the lifecycle of TSN configurations by watching for `TSNApp` Custom Resources (CRs).

The reconciliation loop performs the following:

1. **Watches** for `TSNApp` Custom Resource definitions.
2. **Calculates** the necessary `IdleSlope` (MS/LS) and `DeltaBandwidth` based on the requested link speed and priority.
3. **Configures** the hardware via NETCONF using the `rtaw-cbs` and `ieee8021-fqtss` YANG models.
4. **Reverts** to Strict Priority or deletes entries when the CR is removed.

## Custom Resource Example

Define your TSN requirements in a standard Kubernetes manifest:

```yaml
---
apiVersion: tsn.dev/v1
kind: TsnApp
metadata:
  name: my-tsnapp-resource
spec:
  shaper: CBS
  cbs: {bandwidth: 20000000, pcp: 5}  
  swInterface: PORT_0
---
apiVersion: tsn.dev/v1
kind: TsnApp
metadata:
  name: my-tsnapp-resource
spec:
  shaper: TAS
  tas:
    cycleTime: 20000000
    gateControlList:
      - index: 0
        gateState: 255
        timeInterval: 1000000
      - index: 1
        gateState: 15
        timeInterval: 5000000
      - index: 2
        gateState: 0
        timeInterval: 5000000
  swInterface: PORT_0
```

## Architecture

The operator acts as the control plane "brain" for your network fabric:

1. **User** applies a `TSNApp` YAML.
2. **Operator** detects the change and generates the corresponding XML.
3. **NETCONF Client** pushes the configuration to the **TSN Switch**.

## Getting Started

### Prerequisites

* A Kubernetes cluster (v1.20+).
* A TSN-capable switch supporting NETCONF and the `rtaw-cbs` YANG module.
* `kubectl` installed and configured.

### Installation

1. **Apply the CRDs:**
```bash
kubectl apply -f tsnapp-crd.yaml

```

2. **Deploy the Operator:**
```bash
kubectl apply -f sdv-operator-deployment.yaml

```

## Supported YANG Models

This operator currently implements the following modules:

* `urn:ieee:std:802.1:yang:ieee802-dot1-fqtss-cbs` (Credit-Based Shaper)
* `urn:ieee:std:802.1Q:yang:ieee802-dot1q-sched` (Time-Aware Shaper)
* `ietf-interfaces` (Interface referencing)

---
