FROM frrouting/frr:latest

RUN apk update && apk add nano vim

WORKDIR /etc/frr/
RUN echo "zebra=yes" > daemons
RUN echo "bgpd=yes" >> daemons
RUN echo "ospfd=yes" >> daemons
RUN echo "ospfd_instances=1,2,3" >> daemons
RUN echo "ospf6d=no" >> daemons
RUN echo "ripd=no" >> daemons
RUN echo "ripngd=no" >> daemons
RUN echo "isisd=no" >> daemons
RUN echo "pimd=no" >> daemons
RUN echo "pim6d=no" >> daemons
RUN echo "ldpd=no" >> daemons
RUN echo "nhrpd=no" >> daemons
RUN echo "eigrpd=no" >> daemons
RUN echo "babeld=no" >> daemons
RUN echo "sharpd=no" >> daemons
RUN echo "pbrd=no" >> daemons
RUN echo "bfdd=no" >> daemons
RUN echo "fabricd=no" >> daemons
RUN echo "vrrpd=no" >> daemons
RUN echo "pathd=no" >> daemons

RUN echo "vtysh_enable=yes" >> daemons
RUN echo "zebra_options=\" -A 127.0.0.1 --daemon -s 90000000\"" >> daemons
RUN echo "bgpd_options=\" --daemon -A 127.0.0.1\"" >> daemons
RUN echo "ospfd_options=\" --daemon -A 127.0.0.1\"" >> daemons
RUN echo "ospf6d_options=\" --daemon -A ::1\"" >> daemons
RUN echo "ripd_options=\" --daemon -A 127.0.0.1\"" >> daemons
RUN echo "ripngd_options=\" --daemon -A ::1\"" >> daemons
RUN echo "isisd_options=\" --daemon -A 127.0.0.1\"" >> daemons
RUN echo "pimd_options=\" --daemon -A 127.0.0.1\"" >> daemons
RUN echo "pim6d_options=\" --daemon -A ::1\"" >> daemons
RUN echo "ldpd_options=\" --daemon -A 127.0.0.1\"" >> daemons
RUN echo "nhrpd_options=\" --daemon -A 127.0.0.1\"" >> daemons
RUN echo "eigrpd_options=\" --daemon -A 127.0.0.1\"" >> daemons
RUN echo "babeld_options=\" --daemon -A 127.0.0.1\"" >> daemons
RUN echo "sharpd_options=\" --daemon -A 127.0.0.1\"" >> daemons
RUN echo "pbrd_options=\" --daemon   -A 127.0.0.1\"" >> daemons
RUN echo "staticd_options=\" --daemon -A 127.0.0.1\"" >> daemons
RUN echo "bfdd_options=\" --daemon   -A 127.0.0.1\"" >> daemons
RUN echo "fabricd_options=\" --daemon-A 127.0.0.1\"" >> daemons
RUN echo "vrrpd_options=\" --daemon -A 127.0.0.1\"" >> daemons
RUN echo "pathd_options=\" --daemon -A 127.0.0.1\"" >> daemons


WORKDIR /etc/init.d
RUN echo "" > adv_network
RUN chmod 777 adv_network

WORKDIR /root
CMD  ["/bin/bash","-c","/usr/lib/frr/frrinit.sh start;/etc/init.d/adv_network;/bin/bash"]
