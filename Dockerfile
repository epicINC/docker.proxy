FROM centos
MAINTAINER S <docker@slightboy.net>

RUN ulimit -n 1048576
RUN echo "* soft nofile 1048576" >> /etc/security/limits.conf
RUN echo "* hard nofile 1048576" >> /etc/security/limits.conf
RUN echo "alias net-pf-10 off" >> /etc/modprobe.d/dist.conf
RUN echo "alias ipv6 off" >> /etc/modprobe.d/dist.conf
RUN yum -y install squid
ADD https://raw.githubusercontent.com/epicINC/docker.proxy/master/centos-squid.conf /etc/squid/squid.conf 
ENTRYPOINT ["squid", "restart"] 