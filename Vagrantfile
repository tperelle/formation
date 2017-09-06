# -*- mode: ruby -*-
# # vi: set ft=ruby :

# Cluster Docker
#
# Single box for all cluster nodes
#
# NOTE: Make sure you have Ansible installed for provisionning

# A cluster of 4 Ubuntu VMs on 192.168.33.xx
Vagrant.configure("2") do |config|
  
  # Box
  config.vm.box = "ubuntu/trusty64"
  
  # SSH
  config.ssh.insert_key = false
  #config.ssh.keys_only = false
  #config.ssh.private_key_path = "/Users/thomas/.ssh/id_rsa"

  # Provisioner
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "provision.yml"
  end

  # VMs : 3 nodes and 1 master
  config.vm.define "node1" do |node1|
    node1.vm.network "private_network", ip: "192.168.33.1"
    node1.vm.hostname = "node-1"
  end

  config.vm.define "node2" do |node2|
    node2.vm.network "private_network", ip: "192.168.33.2"
    node2.vm.hostname = "node-2"
  end

  config.vm.define "node3" do |node3|
    node3.vm.network "private_network", ip: "192.168.33.3"
    node3.vm.hostname = "node-3"
  end
  
  config.vm.define "master", primary: true do |master|
    master.vm.network "private_network", ip: "192.168.33.4"
    master.vm.hostname = "master"
  end
end
