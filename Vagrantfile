# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.env.enable
  config.vm.box_check_update = false
  
  # Se necessário criar uma VM para rodar o ansible
  # config.vm.define ENV['ANSIBLE_HOSTNAME'] do |ansible|
  #   ansible.vm.box = ENV['ANBIBLE_BOX']
  #   ansible.vm.hostname = ENV['ANSIBLE_HOSTNAME']
  #   ansible.vm.network "public_network", 
        # :bridge => ENV['INTERFACE_BRIDGE_HOST_FISICO'], 
        # ip: ENV['ANSIBLE_IP']

  #   ansible.vm.provider "virtualbox" do |vb|
  #     vb.name = ENV['ANSIBLE_HOSTNAME']
  #     vb.memory = ENV['RAM']
  #     vb.cpus = ENV['CPU']
  #     vb.customize ["modifyvm", :id, "--groups", ENV['VBOX_GROUP_NAME']]
  #   end
  #   ansible.vm.provision "shell", path:"role_ansible.sh"
  # end

  # CENTOS/RHEL 8.2
  config.vm.define ENV['BD_HOSTNAME'] do |centos|
    centos.vm.box = ENV['SO_BOX']
    centos.vm.network "public_network", 
      :bridge => ENV['INTERFACE_BRIDGE_HOST_FISICO'], 
      ip: ENV['BD_IP']

    centos.vm.provider "virtualbox" do |vb|
      vb.name = ENV['BD_HOSTNAME']
      vb.memory = ENV['RAM']
      vb.cpus = ENV['CPU']
      vb.customize ["modifyvm", :id, "--groups", ENV['VBOX_GROUP_NAME']]
    end
    centos.vm.provision "shell", path:"role_redhat_like.sh"
  end

  # ZABBIX-SERVER
  config.vm.define ENV['ZBX_SERVER_HOSTNAME'] do |centos|
    centos.vm.box = ENV['SO_BOX']
    centos.vm.network "public_network", 
      :bridge => ENV['INTERFACE_BRIDGE_HOST_FISICO'], 
      ip: ENV['ZBX_SERVER__IP']

    centos.vm.provider "virtualbox" do |vb|
      vb.name = ENV['ZBX_SERVER_HOSTNAME']
      vb.memory = ENV['RAM']
      vb.cpus = ENV['CPU']
      vb.customize ["modifyvm", :id, "--groups", ENV['VBOX_GROUP_NAME']]
    end
    centos.vm.provision "shell", path:"role_redhat_like.sh"
  end

  # ZABBIX-FRONTEND
  config.vm.define ENV['ZBX_WEB_HOSTNAME'] do |centos|
    centos.vm.box = ENV['SO_BOX']
    centos.vm.network "public_network", 
      :bridge => ENV['INTERFACE_BRIDGE_HOST_FISICO'], 
      ip: ENV['ZBX_WEB_IP']

    centos.vm.provider "virtualbox" do |vb|
      vb.name = ENV['ZBX_WEB_HOSTNAME']
      vb.memory = ENV['RAM']
      vb.cpus = ENV['CPU']
      vb.customize ["modifyvm", :id, "--groups", ENV['VBOX_GROUP_NAME']]
    end
    centos.vm.provision "shell", path:"role_redhat_like.sh"
  end
end
