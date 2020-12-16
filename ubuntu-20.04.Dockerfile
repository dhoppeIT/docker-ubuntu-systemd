FROM ubuntu:20.04

LABEL maintainer="Dennis Hoppe"

ENV container=docker

ARG DEBIAN_FRONTEND=noninteractive

RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list

RUN apt update ; \
    apt upgrade -y ; \
    apt install -y \
        iproute2 \
        lsb-release \
        python3-apt \
        python3-dev \
        sudo \
        systemd \
        systemd-sysv ; \
    apt clean ; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /lib/systemd/system/sysinit.target.wants/ ; \
    ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1 ; \
    rm -f /lib/systemd/system/multi-user.target.wants/* ; \
    rm -f /etc/systemd/system/*.wants/* ; \
    rm -f /lib/systemd/system/local-fs.target.wants/* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -f /lib/systemd/system/basic.target.wants/* ; \
    rm -f /lib/systemd/system/anaconda.target.wants/* ; \
    rm -f /lib/systemd/system/plymouth* ; \
    rm -f /lib/systemd/system/systemd-update-utmp*

VOLUME ["/sys/fs/cgroup"]

CMD ["/lib/systemd/systemd"]
