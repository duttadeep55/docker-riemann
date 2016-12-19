FROM centos:centos7

RUN yum update -y && \
yum install -y wget  && \
yum install -y epel-release && \
yum install -y java-1.7.0-openjdk && \
yum install -y daemonize && \
yum clean all


RUN wget https://aphyr.com/riemann/riemann-0.2.11-1.noarch.rpm

RUN  rpm -Uvh riemann-0.2.11-1.noarch.rpm


COPY riemann.config /etc/riemann/

# Expose the ports for inbound events and websockets

EXPOSE 5555
EXPOSE 5555/udp
EXPOSE 5556

CMD ["/bin/riemann","/etc/riemann/riemann.config"]
