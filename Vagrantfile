# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Configure the Salt Master VM
  config.vm.define :master do |master_config|
    # Configure the host name
    master_config.vm.host_name = "master.example.com"
    # Configure the box
    master_config.vm.box = "oneiric-salt096"
    # Setup the network
    master_config.vm.network :hostonly, "192.168.1.10"
    # Setup the script provisioner
    master_config.vm.provision :shell, :path => "master_setup.sh"
  end

  # Configure the Salt Syndic VM
  config.vm.define :syndic do |syndic_config|
    # Configure the host name
    syndic_config.vm.host_name = "syndic.example.com"
    # Configure the box
    syndic_config.vm.box = "oneiric-salt096"
    # Setup the network
    syndic_config.vm.network :hostonly, "192.168.1.11"
    # Setup the script provisioner
    syndic_config.vm.provision :shell do |shell|
      shell.path = "syndic_setup.sh"
      shell.args = "192.168.1.10" # master
    end
  end

  # Configure the Salt Minion VM
  config.vm.define :minion do |minion_config|
    # Configure the host name
    minion_config.vm.host_name = "minion.example.com"
    # Configure the box
    minion_config.vm.box = "oneiric-salt096"
    # Setup the network
    minion_config.vm.network :hostonly, "192.168.1.12"
    # Setup the script provisioner
    minion_config.vm.provision :shell do |shell|
      shell.path = "minion_setup.sh"
      shell.args = "192.168.1.11" # syndic_master
    end
  end

  config.vm.define :minion2 do |minion_config|
    # Configure the host name
    minion_config.vm.host_name = "minion2.example.com"
    # Configure the box
    minion_config.vm.box = "oneiric-salt096"
    # Setup the network
    minion_config.vm.network :hostonly, "192.168.1.13"
    # Setup the script provisioner
    minion_config.vm.provision :shell do |shell|
      shell.path = "minion_setup.sh"
      shell.args = "192.168.1.11" # syndic_master
    end
  end

end
