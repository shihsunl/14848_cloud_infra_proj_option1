#! /bin/bash
export JAVA_HOME=/usr/lib/jdk1.8.0_211
export PATH=$PATH:$JAVA_HOME/bin

# download spark
mkdir /temp/spark
cd /temp/spark
curl -L https://dlcdn.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz -o spark-3.1.2-bin-hadoop3.2.tgz
tar -zxvf spark-3.1.2-bin-hadoop3.2.tgz
# launch spark
# ./spark-3.1.2-bin-hadoop3.2/bin/spark-shell
