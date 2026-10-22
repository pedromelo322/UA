#!/usr/bin/env python3
import json
import sys

import zmq

#DEFAULT_ENDPOINT = "ipc:///tmp/sdv_flows.ipc"
ENDPOINT1 = "tcp://10.0.10.13:5556"
ENDPOINT2 = "tcp://10.0.10.12:5556"
TOPIC = "flows"

PROTO_NAMES = {1: "icmp", 6: "tcp", 17: "udp"}


def format_throughput(bps):
    if bps is None:
        return "-"
    for unit, scale in (("Gbps", 1e9), ("Mbps", 1e6), ("kbps", 1e3)):
        if bps >= scale:
            return f"{bps / scale:.2f} {unit}"
    return f"{bps:.0f} bps"


def print_snapshot(snap):
    flows = snap["flows"]

    print("\033[H\033[J", end="")
    print(f"snapshot @ {snap['ts_unix_ns'] / 1e9:.3f}  —  {len(flows)} flow(s)\n")
    print(f"{'ENDPOINT A':<22} {'ENDPOINT B':<22} {'PROTO':<6} "
          f"{'PKTS':>9} {'BYTES':>12} {'MEAN':>7} {'BDW':>12}")
    print("-" * 95)

    for f in sorted(flows, key=lambda x: x["packets"], reverse=True):
        ep_a = f"{f['ip_a']}:{f['port_a']}"
        ep_b = f"{f['ip_b']}:{f['port_b']}"
        proto = PROTO_NAMES.get(f["proto"], str(f["proto"]))
        print(f"{ep_a:<22} {ep_b:<22} {proto:<6} "
              f"{f['packets']:>9} {f['total_bytes']:>12} "
              f"{f['mean_pkt_size']:>7} "
              f"{format_throughput(f['throughput_bps']):>12}")

    sys.stdout.flush()


def main():
    #endpoint = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_ENDPOINT

    ctx = zmq.Context()
    sub = ctx.socket(zmq.SUB)
    sub.connect(ENDPOINT1)
    sub.connect(ENDPOINT2)
    sub.setsockopt_string(zmq.SUBSCRIBE, TOPIC)

    print(f"Connected to {ENDPOINT1};{ENDPOINT2} waiting for snapshots (Ctrl+C to exit)...")

    try:
        while True:
            _topic, payload = sub.recv_multipart()
            print_snapshot(json.loads(payload))
    except KeyboardInterrupt:
        print("\nExiting.")
    finally:
        sub.close()
        ctx.destroy()


if __name__ == "__main__":
    main()
