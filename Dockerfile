# docker base image for basic programming tools

FROM ubuntu:xenial

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y --no-install-recommends install \
    net-tools telnet traceroute openssh-client nano vim-tiny iputils-ping \
    python python3 python-pymysql python3-pymysql python-pygresql python3-postgresql \
    python-pysnmp4 python3-pysnmp4 python-ldap3 python3-ldap3 python-paramiko python3-paramiko \
    python-mailer python3-aioxmlrpc python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade setuptools
RUN pip3 install netaddr scapy

VOLUME [ "/root" ]
CMD [ "sh", "-c", "cd; exec bash -i" ]