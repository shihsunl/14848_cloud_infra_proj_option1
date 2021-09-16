#! /bin/bash
export JAVA_HOME=/usr/lib/jdk1.8.0_211
export PATH=$PATH:$JAVA_HOME/bin

wget https://archive.apache.org/dist/kafka/2.0.0/kafka_2.12-2.0.0.tgz
tar -zxvf kafka_2.12-2.0.0.tgz
tar xf /temp/install/zookeeper/ssl.tar.gz -C /opt;

# install kafka and zookeeper
mkdir /opt/librdkafka
cd /opt/librdkafka
wget https://github.com/edenhill/librdkafka/archive/v0.11.5.tar.gz
tar xf v0.11.5.tar.gz
cd librdkafka-0.11.5
./configure
make && make install
ldconfig

# cleanup
ps aux | grep server.properties | awk {'print $2'} | xargs kill -9;
ps aux | grep zkclient | awk {'print $2'} | xargs kill -9;
sleep 5;

cd /opt
rm -rf kafka
rm -rf kafka-logs
rm -rf zookeeper
rm -f kafka*.tgz

cp -R /temp/install/kafka_2.12-2.0.0 /opt/kafka

# stop kafka
ps aux | grep server.properties | awk {'print $2'} | xargs kill -9;
ps aux | grep zkclient | awk {'print $2'} | xargs kill -9;

# start zookeeper
/temp/install/zookeeper/setup.sh

export KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"
nohup /opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties > /dev/null 2>&1 &


#zookeeper_ready=`netstat -an | grep LISTEN | grep 2080`;
#if [ ! -z "$zookeeper_ready" ]; then
#    break;
#fi

