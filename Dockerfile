FROM yangxiaofeng/ambari-base:latest
MAINTAINER Breeze
RUN mvn versions:set -DnewVersion=2.7.5.0.0 \
    && pushd ambari-metrics \
    && mvn versions:set -DnewVersion=2.7.5.0.0 \
    && popd \
    && mvn -B clean install rpm:rpm -DnewVersion=2.7.5.0.0 -DbuildNumber=5895e4ed6b30a2da8a90fee2403b6cab91d19972 -DskipTests -Dpython.ver="python >= 2.6"
CMD ["/bin/bash"]
