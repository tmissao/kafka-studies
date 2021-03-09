#!/bin/bash
# Packages
sudo apt-get update && \
      sudo apt-get -y install wget ca-certificates zip net-tools vim nano tar netcat

# Java Open JDK 8
sudo apt-get -y install openjdk-8-jdk
java -version

# Disable RAM Swap - can set to 0 on certain Linux distro
sudo sysctl vm.swappiness=1
echo 'vm.swappiness=1' | sudo tee --append /etc/sysctl.conf

# Add hosts entries (mocking DNS) - put relevant IPs here
echo "172.18.1.100 kafka1
172.18.1.100 zookeeper1
172.18.2.100 kafka2
172.18.2.100 zookeeper2
172.18.3.100 kafka3
172.18.3.100 zookeeper3" | sudo tee --append /etc/hosts

# download Zookeeper and Kafka. Recommended is latest Kafka (0.10.2.1) and Scala 2.12
#wget https://archive.apache.org/dist/kafka/0.10.2.1/kafka_2.12-0.10.2.1.tgz
wget https://downloads.apache.org/kafka/2.7.0/kafka_2.12-2.7.0.tgz
#tar -xvzf kafka_2.12-0.10.2.1.tgz
tar -xvzf kafka_2.12-2.7.0.tgz
#rm kafka_2.12-0.10.2.1.tgz
rm kafka_2.12-2.7.0.tgz
#mv kafka_2.12-0.10.2.1 kafka
mv kafka_2.12-2.7.0/ kafka
cd kafka/

# Zookeeper quickstart
#cat config/zookeeper.properties
#bin/zookeeper-server-start.sh config/zookeeper.properties
# binding to port 2181 -> you're good. Ctrl+C to exit

# Testing Zookeeper install
# Start Zookeeper in the background
echo "4lw.commands.whitelist=*" >> config/zookeeper.properties
bin/zookeeper-server-start.sh -daemon config/zookeeper.properties
#bin/zookeeper-shell.sh localhost:2181
#ls /

# demonstrate the use of a 4 letter word
echo "ruok" | nc localhost 2181 ; echo

# Install Zookeeper boot scripts
# cat zookeeper file
sudo nano /etc/init.d/zookeeper
sudo chmod +x /etc/init.d/zookeeper
sudo chown root:root /etc/init.d/zookeeper
# you can safely ignore the warning
sudo update-rc.d zookeeper defaults
# stop zookeeper
sudo service zookeeper stop
# verify it's stopped
nc -vz localhost 2181
# start zookeeper
sudo service zookeeper start
# verify it's started
nc -vz localhost 2181
echo "ruok" | nc localhost 2181 ; echo
# check the logs
cat logs/zookeeper.out