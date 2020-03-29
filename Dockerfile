FROM centos:7
MAINTAINER Beeze
ADD . /opt/
WORKDIR /opt
RUN yum install -y ambari-server*.rpm \
    && ambari-server setup -s \
    && ambari-server start
EXPOSE 8080
CMD ["/bin/bash"]

