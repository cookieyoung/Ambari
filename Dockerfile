FROM centos:7
MAINTAINER Breeze

RUN yum install epel-release -y && yum clean all
RUN yum update -y && yum clean all
RUN yum install java-1.8.0-openjdk && yum install 
RUN yum install wget -y
RUN wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo && yum -y install apache-maven
RUN wget https://mirror-hk.koddos.net/apache/ambari/ambari-2.7.5 && tar xfvz apache-ambari-2.7.5-src.tar.gz
WORKDIR apache-ambari-2.7.5-src
RUN mvn versions:set -DnewVersion=2.7.5.0.0 && pushd ambari-metrics
RUN mvn versions:set -DnewVersion=2.7.5.0.0 && popd
RUN mvn -B clean install rpm:rpm -DnewVersion=2.7.5.0.0 -DbuildNumber=5895e4ed6b30a2da8a90fee2403b6cab91d19972 -DskipTests -Dpython.ver="python >= 2.6"
RUN yum install ambari-server*.rpm
CMD ["/bin/bash"]
