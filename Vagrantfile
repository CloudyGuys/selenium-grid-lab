# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "puppetlabs/centos-7.0-64-puppet"
  config.vm.box_url = "https://atlas.hashicorp.com/puppetlabs/boxes/centos-7.0-64-puppet"
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end
	
  config.vm.define "hub" do |hub_config|
	hub_config.vm.network "private_network", ip: "192.168.1.10"
    hub_config.vm.hostname = "hub-demo"
    hub_config.vm.network :forwarded_port, host: 4444, guest: 4444
    hub_config.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet-scripts/selenium-hub/manifests"
	  puppet.module_path = [ 'puppet-scripts/selenium-hub/modules', 'puppet-scripts/common-modules' ]
      puppet.manifest_file = "site.pp"
      puppet.options = "--verbose --debug"
    end
  end

  config.vm.define "node" do |node_config|
	node_config.vm.network "private_network", ip: "192.168.1.11"
    node_config.vm.hostname = "node-demo"
    node_config.vm.network :forwarded_port, host: 5555, guest: 5555
    node_config.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet-scripts/selenium-node/manifests"
      puppet.module_path = [ 'puppet-scripts/selenium-node/modules', 'puppet-scripts/common-modules' ]
      puppet.manifest_file = "site.pp"
      puppet.options = "--verbose --debug"
    end
  end

end




