# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.5-i386-v20140504.box"

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision "shell", path: "provisioning.sh"

  config.vm.define :host01 do |host01|
    host01.vm.hostname = "host01"
    host01.vm.network :private_network, ip: "192.168.10.14"
    host01.vm.network :forwarded_port, guest: 80, host: 18080, host_ip: "127.0.0.1", id: "http", auto_correct: true

    host01.vm.provider "virtualbox" do |v| 
      v.customize ["modifyvm", :id, "--memory", 512]
    end
  end
end
