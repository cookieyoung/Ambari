FROM indigo/centos-maven:latest

MAINTAINER Breeze

RUN yum install wget -y
RUN wget  https://apache.website-solution.net/ambari/ambari-2.7.5/apache-ambari-2.7.5-src.tar.gz && tar xfvz apache-ambari-2.7.5-src.tar.gz
WORKDIR apache-ambari-2.7.5-src
CMD ["mvn"]

