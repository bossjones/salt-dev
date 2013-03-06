#!/bin/bash

echo 'Setting up Salt Master'
sudo wget -O - http://bootstrap.saltstack.org | sudo sh -s -- -M

echo 'Copying Salt Master config file to VM'
sudo cp /vagrant/master.conf /etc/salt/master

echo 'Restarting Salt Master process...'
sudo service salt-master restart
echo 'Salt Master process restarted.'
