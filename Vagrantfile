# -*- mode: ruby -*-
# vi: set ft=ruby

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	#config.vm.provider
	config.vm.box = "bento/ubuntu-22.04"
	config.vm.hostname="Ubuntu 22.04"

	config.vm.define "ubuntu22.04" do |ubuntu|
		ubuntu.vm.hostname = "ubuntu22.04"
	end

	config.vm.provision "file", source: "./bin", destination: "$HOME/bin"

	config.vm.provision:shell, path: "bin/bootstrap.sh"

    config.vm.network "forwarded_port", guest: 5901, host: 29901, host_ip: "0.0.0.0", auto_correct: true
    config.vm.network "forwarded_port", guest: 5902, host: 29902, host_ip: "0.0.0.0", auto_correct: true
    config.vm.network "forwarded_port", guest: 5903, host: 29903, host_ip: "0.0.0.0", auto_correct: true
    config.vm.network "forwarded_port", guest: 5904, host: 29904, host_ip: "0.0.0.0", auto_correct: true
end
