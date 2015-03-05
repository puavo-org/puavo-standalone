# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "puavo-standalone"
  config.vm.box = "ubuntu/precise64"

  config.vm.network "forwarded_port", guest: 8081, host: 8081, host_ip: "0.0.0.0"
  config.vm.network "forwarded_port", guest: 3002, host: 3002, host_ip: "0.0.0.0"
  config.vm.network "forwarded_port", guest: 9292, host: 9292, host_ip: "0.0.0.0"

  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", (1024*4).to_s]
  end

  config.vm.provision "shell", path: "setup.sh"
end
