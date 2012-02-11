#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}
[ "$#" -eq 1 ] || die "1 argument required, $# provided"

hostname=`hostname -s`
echo 'Setting up Salt Syndic with name: ' $hostname

echo 'Salt Master IP address is ' $1

# syndic master
sudo sed 's/#syndic_master: masterofmaster/syndic_master: '${1}'/g' /vagrant/syndic_master.conf | sudo tee /etc/salt/master > /dev/null
# syndic minion
sudo sed 's/#master: salt/master: '${1}'/g' /vagrant/minion.conf | sudo tee /etc/salt/minion > /dev/null

echo 'Starting Salt Master'
nohup sudo salt-master > /dev/null 2>&1 &
echo 'Salt Master started'

echo 'Starting Salt Syndic'
nohup sudo salt-syndic > /dev/null 2>&1 &
echo 'Salt Syndic started'
