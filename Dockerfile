FROM centos:7
MAINTAINER Beeze_Yang
ADD https://github.com/cookieyoung/Ambari/releases/download/ambari-server.2.7.5/ambari-server-2.7.5.0-0.x86_64.rpm.zip /opt/
WORKDIR /opt
RUN yum install -y unzip \
    && unzip ambari-server-2.7.5.0-0.x86_64.rpm.zip
RUN yum install -y ambari-server*.rpm \
    && ambari-server setup -s 
EXPOSE 8080
CMD ["/bin/bash"]

