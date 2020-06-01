#!/bin/bash

echo "install puppet repo"

rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm

yum install puppet -t

exec bash

"echo populating"

echo "[main]
server = puppet-server.exercise.com
environment = production
runinterval = 3600" > /etc/puppetlabs/puppet/puppet.conf

reboot
