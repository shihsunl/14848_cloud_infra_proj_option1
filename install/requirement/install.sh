#! /bin/bash
apt-get update
echo "apt-get install -y python3-pip"
apt-get install -y python3-pip
apt-get install -y net-tools
apt-get install -y libssl-dev openssl
pip3 install requests