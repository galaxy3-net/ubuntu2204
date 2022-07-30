#!/usr/bin/bash
# Bootstrap Machine

step=1
step() {
	echo "Step $step $1"
	step=$((step+1))
}

resolve_dns() {
	step "===== Create symlink to /run/systemd/resolve/resolv.conf ====="
	cat /etc/resolv.conf
	sudo mv /etc/resolv.conf /etc/resolv.cof.orig
	sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
	cat /etc/resolv.conf
}

mariadb_server() {

	step "===== Create symlink to /run/systemd/resolve/resolv.conf ====="
	sudo apt update && sudo apt install -y dos2unix expect mariadb-server
	dos2unix ~vagrant/mysql_secure_install.sh
	chmod +x ~vagrant/mysql_secure_install.sh
	~vagrant/mysql_secure_install.sh
}

resolve_dns
mariadb_server