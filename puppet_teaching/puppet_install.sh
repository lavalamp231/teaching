#!/bin/bash

echo "install puppet repo"

rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm

yum install puppet -y

echo "populating puppet.conf"

echo "[main]
server = puppet-server.exercise.com
environment = production
runinterval = 3600" > /etc/puppetlabs/puppet/puppet.conf
