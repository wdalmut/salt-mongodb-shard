# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.synced_folder "deploy", "/srv/"
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.ssh.forward_agent = true

  config.vm.provision :salt do |salt|
    salt.minion_config = "./deploy/minion"
    salt.verbose = true
    salt.run_highstate = true
    salt.install_type = "daily"
    salt.pillar({
        "hosts" => [
            "127.0.0.1  localhost",
            "192.168.10.201 mo1.local",
            "192.168.10.202 mo2.local",
            "192.168.10.203 mo3.local"
        ]
    })
  end

  config.vm.define :mo1 do |mo1|
    mo1.vm.network "private_network", ip: "192.168.10.201"
    mo1.vm.hostname = "mo1.local"
    mo1.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "254", "--name", "mo1.local"]
    end
  end

  config.vm.define :mo2 do |mo2|
    mo2.vm.network "private_network", ip: "192.168.10.202"
    mo2.vm.hostname = "mo2.local"
    mo2.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "254", "--name", "mo2.local"]
    end
  end
  
  config.vm.define :mo3 do |mo3|
    mo3.vm.network "private_network", ip: "192.168.10.203"
    mo3.vm.hostname = "mo3.local"
    mo3.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "254", "--name", "mo3.local"]
    end
  end
end
