FROM centos
MAINTAINER S <docker@slightboy.net>

RUN setenforce 0
RUN ulimit -n 1048576
RUN echo "* soft nofile 1048576" >> /etc/security/limits.conf
RUN echo "* hard nofile 1048576" >> /etc/security/limits.conf
RUN echo "alias net-pf-10 off" >> /etc/modprobe.d/dist.conf
RUN echo "alias ipv6 off" >> /etc/modprobe.d/dist.conf
RUN yum -y install squid
RUN wget -O /etc/squid/squid.conf https://raw.githubusercontent.com/epicINC/docker.proxy/master/centos-squid.conf
RUN squid restart