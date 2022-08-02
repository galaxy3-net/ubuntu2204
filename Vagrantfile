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

    config.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "playbook.yml"
    end

	#config.vm.provision:shell, path: "bin/bootstrap.sh"
    config.vm.synced_folder "~/Downloads", "/Downloads", owner: "1001", group: "1001", mount_options: ["fmode=777", "dmode=777"], create: true

    config.vm.network "forwarded_port", guest: 5901, host: 29901, host_ip: "0.0.0.0", auto_correct: true
    config.vm.network "forwarded_port", guest: 5902, host: 29902, host_ip: "0.0.0.0", auto_correct: true
    config.vm.network "forwarded_port", guest: 5903, host: 29903, host_ip: "0.0.0.0", auto_correct: true
    config.vm.network "forwarded_port", guest: 5904, host: 29904, host_ip: "0.0.0.0", auto_correct: true
end
