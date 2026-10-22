CLANG ?= clang
BPFTOOL ?= bpftool
CC ?= gcc

ARCH      := $(shell uname -m | sed 's/x86_64/x86/' | sed 's/aarch64/arm64/')
MULTIARCH := $(shell uname -m)-linux-gnu

BPF_OBJ  = flow_monitor.bpf.o
SKEL     = flow_monitor.skel.h
USER_BIN = flow_monitor

ZMQ_CFLAGS := $(shell pkg-config --cflags libzmq)
ZMQ_LIBS   := $(shell pkg-config --libs libzmq)

JSON_CFLAGS := $(shell pkg-config --cflags json-c)
JSON_LIBS   := $(shell pkg-config --libs json-c)

.PHONY: all clean

all: $(USER_BIN)

# 0. Gerar vmlinux.h a partir do BTF do kernel local
vmlinux.h:
	$(BPFTOOL) btf dump file /sys/kernel/btf/vmlinux format c > $@

# 1. Compilar o programa eBPF
$(BPF_OBJ): flow_monitor.bpf.c vmlinux.h
	$(CLANG) -g -O2 -target bpf -D__TARGET_ARCH_$(ARCH) -I/usr/include/$(MULTIARCH) -c $< -o $@

# 2. Gerar o skeleton
$(SKEL): $(BPF_OBJ)
	$(BPFTOOL) gen skeleton $< > $@

# 3. Compilar o programa userspace
$(USER_BIN): flow_monitor.c $(SKEL)
	$(CC) -g -Wall $(ZMQ_CFLAGS) $(JSON_CFLAGS) -o $@ $< -lbpf -lelf -lz $(ZMQ_LIBS) $(JSON_LIBS)

clean:
	rm -f $(BPF_OBJ) $(SKEL) $(USER_BIN) vmlinux.h
