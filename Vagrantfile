# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
  end
  config.vm.define :master do |master_config|
    master_config.vm.box = "centos-6.6-x86_64"
    master_config.vm.host_name = 'saltmaster.local'
    master_config.vm.network "private_network", ip: "192.168.50.10"
    master_config.vm.synced_folder "saltstack/salt/", "/srv/salt"
    master_config.vm.synced_folder "saltstack/pillar/", "/srv/pillar"

    master_config.vm.provision "shell", inline: "/bin/sh /vagrant/iptable_fix.sh"
   
    master_config.vm.provision :salt do |salt|
      salt.install_type = "stable"
      salt.install_master = true
      salt.no_minion = true
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define :minion1 do |minion1_config|
    minion1_config.vm.box = "centos-6.6-x86_64"
    minion1_config.vm.host_name = 'saltminion1.local'
    minion1_config.vm.network "private_network", ip: "192.168.50.11"

    minion1_config.vm.provision :salt do |salt|
      salt.minion_config = "saltstack/etc/minion1"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define :minion2 do |minion2_config|
    minion2_config.vm.box = "ubuntu/trusty64"
    minion2_config.vm.host_name = 'saltminion2.local'
    minion2_config.vm.network "private_network", ip: "192.168.50.12"

    minion2_config.vm.provision :salt do |salt|
      salt.minion_config = "saltstack/etc/minion2"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

end



