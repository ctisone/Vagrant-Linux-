# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  #
  # The Vagrant box will be fixed as to version and auto-update will be turned
  # off.  This promotes system stability.
  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "20211026.0.0"
  config.vm.box_check_update = false
  config.vm.boot_timeout = 300
  config.vm.guest = :linux
 
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.


  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "C:\\GitProjects", "/home/vagrant/GitProjects", create: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  #
  # This script finds the host machine public key named VagrantKey.pub and copies its contents
  # to the guest authorized_keys file.
  config.vm.provision "shell" do |s|
    # Use host side Ruby scripting to read the Vargrant public key file from the user .ssh directory
    sshPublicKey = ""
    if File.file?("#{Dir.home}/.ssh/VagrantKey.pub")
      sshPublicKey = File.readlines("#{Dir.home}/.ssh/VagrantKey.pub").first.strip
    else
      puts "Cannot locate VagrantKey.pub. Keys cannot be loaded into the virtual machine."
    end
    s.inline = <<-SHELL
      # Switch to guest side script. If the key variable is empty, we can't do anything
      if [ -z "#{sshPublicKey}" ]; then
        echo "No SSH key available to provision."
      # If the key is already in the authorized key file, no need to do anything
      elif grep -sq "#{sshPublicKey}" /home/vagrant/.ssh/authorized_keys; then
        echo "SSH keys already provisioned."
      else
        # Add the Vagrant public key to the VM authorized keys file
        echo "SSH key provisioning..."
        mkdir -p /home/vagrant/.ssh/
        echo #{sshPublicKey} >> /home/vagrant/.ssh/authorized_keys
      fi
    SHELL
  end
  #
  # Copy the host .gitconfig file to the guest so that git is configured there as well
  # (at least the basics are)
  #
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  #
  # Use the external guest side provisioning script to complete the provisioning process
  #
  config.vm.provision "shell", path: "VMProvision.sh"
end
