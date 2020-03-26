FROM opennms/maven:1.8.0.242.b08-3.6.3-b3863

MAINTAINER Breeze

RUN yum install wget -y
RUN wget  https://apache.website-solution.net/ambari/ambari-2.7.5/apache-ambari-2.7.5-src.tar.gz && tar xfvz apache-ambari-2.7.5-src.tar.gz
WORKDIR apache-ambari-2.7.5-src
CMD ["mvn"]

