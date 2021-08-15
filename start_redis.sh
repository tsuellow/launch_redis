#!/bin/sh
#this script modifies the conf file and starts the server
private_ip=$(hostname -I)
sudo sed -e "s/^daemonize no.*/daemonize yes/" -e "s/^protected-mode.*/protected-mode no/" -e "s/^bind .*/bind $private_ip/" -e "s/^dir .*/dir \/var\/redis\/6379\//" -e "s/^loglevel .*/loglevel notice/" -e "s/^logfile .*/logfile \/var\/log\/redis.log/" /etc/redis/redis.conf | sudo tee /etc/redis/6379.conf
redis-server /etc/redis/6379.conf