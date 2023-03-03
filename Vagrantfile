# -*- mode: ruby -*-
# vi: set ft=ruby

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	#config.vm.provider
	config.vm.box = "ubuntu/jammy64"
	config.vm.hostname="Ubuntu 22.04"

	config.vm.define "ubuntu22.04" do |ubuntu|
		ubuntu.vm.hostname = "ubuntu22.04"
	end

    #config.vm.provider :virtualbox do |vb|
    #	config.vm.disk :dvd, name: "installer", file: "C:\Program Files\Oracle\VirtualBox\VBoxGuestAdditions.iso"
    #end

	config.vm.provision "file", source: "./bin", destination: "$HOME/bin"
	#config.vm.provision "file", source: "C:\Program Files\Oracle\VirtualBox\VBoxGuestAdditions.iso"

    #config.vm.provision:shell, path: "bin/bootstrap.sh"
##    config.vm.provision "ansible_local" do |ansible|
##        ansible.playbook = "playbook.yml"
##    end

    # config.vm.provision :reboot

	#config.vm.provision:shell, path: "bin/bootstrap.sh"
	config.vm.provision:shell, inline: "cd / && sudo git clone https://github.com/galaxy3-net/testscripts.git && sudo chown -R vagrant:vagrant /testscripts/"
    config.vm.provision:shell, inline: "nohup bash /testscripts/bin/ansible.sh &"

#	config.vm.provision:shell, inline: "apt-get update && apt-get upgrade -y && sudo apt-get install -y ansible"
#	config.vm.provision:shell, inline: "wget -O ~/.profile https://raw.githubusercontent.com/galaxy3-net/testscripts/main/.profile"
#	config.vm.provision:shell, inline: "wget -O ~vagrant/.profile https://raw.githubusercontent.com/galaxy3-net/testscripts/main/.profile"
    config.vm.synced_folder "~/Downloads", "/Downloads", owner: "1001", group: "1001", mount_options: ["fmode=777", "dmode=777"], create: true

    config.vm.network "forwarded_port", guest: 5901, host: 29901, host_ip: "0.0.0.0", auto_correct: true
    config.vm.network "forwarded_port", guest: 5902, host: 29902, host_ip: "0.0.0.0", auto_correct: true
    config.vm.network "forwarded_port", guest: 5903, host: 29903, host_ip: "0.0.0.0", auto_correct: true
    config.vm.network "forwarded_port", guest: 5904, host: 29904, host_ip: "0.0.0.0", auto_correct: true
    config.vm.network "forwarded_port", guest: 3306, host: 3307, host_ip: "0.0.0.0", auto_correct: true


    config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        # Uncomment ONE the lines below to control how much RAM Vagrant gives the VM
        # We recommend starting with 4096 (4Gb), and moving down if necessary
        # vb.memory = "1024" # 1Gb
        # vb.memory = "2048" # 2Gb
        # vb.memory = "4096" # 4Gb
        vb.name = "Farber (ubuntu2204)"
        vb.gui = false
        vb.cpus = "8"
        vb.memory = "8192"
        #vb.customize ["modifyvm", :id, "--description", File.read("Description")]
        vb.customize ['modifyvm', :id, '--vrde', 'off']
        vb.customize ['modifyvm', :id, '--vram', '128']
        vb.customize ['modifyvm', :id, '--graphicscontroller', 'vboxsvga']
    end

end