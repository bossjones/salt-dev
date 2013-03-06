This project is to be used as a base project when developing Salt projects using the Vagrant tool for development and testing purposes.

### Intro

It contains a base `Vagrantfile` that configures two virtual machines - the current configuration uses Ubuntu 12.04 32bit (precise32) Vagrant boxes as the base:

* A **Salt Master** that contains a file server of salt states. FQDN is 'master.example.com'
* A **Salt Minion** that is automatically configured on startup. FQDN is 'minion.example.com'

The latest Salt master/minion is automatically installed in each VM appropriately. The salt master VM has auto accepting minion keys turned **on** as this is a development environment.

The salt minion VM will run the command `salt-call state.highstate` to configure the node as necessary from the Salt State file found in directory `srv/salt`.

There is an example that configures an apache server changing the default `index.html` file like the tutorial found from http://saltstack.org.

### Setup

* Install Vagrant via [Vagrant Downloads](http://downloads.vagrantup.com/)
* Install salty-vagrant via `vagrant gem install vagrant-salt`
* Clone this repository and `cd` into it
* run `vagrant up`

### Usage

* simply run `vagrant up` if everything is already installed as per the Setup section above.

### Notes

Currently only tested with Ubuntu 12.04 32 bit

### Todo

* clean up the bootstrapping process; if salt master/minion is already installed, why attempt to bootstrap it again?