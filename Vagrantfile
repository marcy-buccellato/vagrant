# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ciaopetro"

  # virtualbox setup config
  config.vm.provider "virtualbox" do |vb|
    vb.box_url = "http://files.vagrantup.com/precise64.box"
    vb.customize ["modifyvm", :id, "--name", "Local_Environment", "--memory", 2048]
  end

  # vmware setup config
  config.vm.provider "vmware_fusion" do |v, override|
    # override default box and url it is downloaded from
    override.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"
    # config.vm.box_url = "/vagrant_files/precise64_vmware.box"

  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # # Create a private network, which allows host-only access to the machine
  # # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # configure network so that the box is assigned a free ip
  config.vm.network "public_network", :bridge => 'en1: Wi-Fi (AirPort)'

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "../", "/var/www", nfs: false

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.roles_path = "chef/roles"
    chef.data_bags_path = "chef/data_bags"
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "emacs"
    chef.add_recipe "apache2::mod_php5"
    chef.add_recipe "apache2::mod_rewrite"
    chef.add_recipe "apache2::ciaopetro_conf"
    chef.add_recipe "apache2::thornwoodcabinetry_conf"
    chef.add_recipe "mysql"
    chef.add_recipe "mysql::server"
    chef.add_recipe "database::mysql"
    chef.add_recipe "database::thornwood"
    chef.add_recipe "php"
    chef.add_recipe "php::module_mysql"
    # chef.add_recipe "openssl"
    # chef.add_recipe "wordpress"
    # chef.add_role "web"
  
    # # You may also specify custom JSON attributes:
    # chef.json = { :mysql_password => "foo" }
    chef.json = {
      :apache => {
        :user => "vagrant",
        :group => "vagrant"
      },
      :mysql => {
        :server_root_password => "root",
        :allow_remote_root => true,
        :server_debian_password => 'ciao',
        :server_repl_password => 'ciao'
      }
    }
  end

end
