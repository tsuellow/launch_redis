#!/bin/sh
sudo yum -y update
sudo yum-config-manager --enable epel -y
sudo amazon-linux-extras install redis6 -y
sudo mkdir /var/redis
sudo mkdir /var/redis/6379
sudo chmod -R 777 /etc/redis
sudo chmod -R 777 /var/log
sudo chmod -R 777 /var/redis/6379
sudo cp /etc/redis/redis.conf /etc/redis/6379.conf
sudo sed -e "s/^daemonize no$/daemonize yes/" -e "s/^bind 127.0.0.1$/bind 172.31.93.48/" -e "s/^dir \.\//dir \/var\/redis\/6379\//" -e "s/^loglevel verbose$/loglevel notice/" -e "s/^logfile \"\"$/logfile \/var\/log\/redis.log/" /etc/redis/6379.conf | sudo tee /etc/redis/6379.conf
redis-server 6379.conf