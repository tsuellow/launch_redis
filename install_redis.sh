#!/bin/sh
#this script installs redis and sets it up for later server initiallization, no changes to the conf file are performed
sudo yum -y update
sudo yum-config-manager --enable epel -y
sudo amazon-linux-extras install redis6 -y
sudo mkdir /var/redis
sudo mkdir /var/redis/6379
sudo chmod -R 777 /etc/redis
sudo chmod -R 777 /var/log
sudo chmod -R 777 /var/redis/6379
sudo cp /etc/redis/redis.conf /etc/redis/6379.conf
sed '$ a vm.overcommit_memory = 1' /etc/sysctl.conf
