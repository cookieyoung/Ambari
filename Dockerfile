FROM yangxiaofeng/ambari-base:0.2
MAINTAINER Breeze
RUN yum install -y git
RUN yum install -y rpm-build && yum install -y gcc-c++ 
RUN wget https://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg#md5=fe1f997bc722265116870bc7919059ea \
    && sh setuptools-0.6c11-py2.7.egg \
    && rm -f setuptools-0.6c11-py2.7.egg
RUN mvn versions:set -DnewVersion=2.7.5.0.0 \
    && pushd ambari-metrics \
    && mvn versions:set -DnewVersion=2.7.5.0.0 \
    && popd \
    && mvn -B clean install rpm:rpm -DnewVersion=2.7.5.0.0 -DbuildNumber=5895e4ed6b30a2da8a90fee2403b6cab91d19972 -DskipTests -Dpython.ver="python >= 2.6" -Drat.skip=true -X
CMD ["/bin/bash"]
