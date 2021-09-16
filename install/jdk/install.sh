#! /bin/bash

# install jdk
wget https://github.com/frekele/oracle-java/releases/download/8u211-b12/jdk-8u211-linux-x64.tar.gz
tar -zxvf jdk-8u211-linux-x64.tar.gz

cp -R /temp/install/jdk1.8.0_211 /usr/lib/jdk1.8.0_211
ln -s /usr/lib/jdk1.8.0_211/bin/java /etc/alternatives/java
export JAVA_HOME=/usr/lib/jdk1.8.0_211
export PATH=$PATH:$JAVA_HOME/bin