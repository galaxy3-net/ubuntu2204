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

	step "===== Create mariadb_server ====="
	sudo apt update && sudo apt install -y dos2unix expect mariadb-server
	dos2unix ~vagrant/mysql_secure_install.sh
	chmod +x ~vagrant/mysql_secure_install.sh
	~vagrant/mysql_secure_install.sh
	wget https://dev.mysql.com/get/mysql-apt-config_0.8.23-1_all.deb
	sudo apt install -y ./mysql-apt-config_0.8.23-1_all.deb
	sudo apt update
	sudo snap install mysql-workbench-community
}

mysql_server() {

	step "===== Create mysql_server ====="
	sudo apt update && sudo apt install -y dos2unix expect mysql-server-8.0
	dos2unix ~vagrant/mysql_secure_install.sh
	chmod +x ~vagrant/mysql_secure_install.sh
	~vagrant/mysql_secure_install.sh
}

mysql_workbench() {

	step "===== Create mysql_workbench ====="
	sudo snap install mysql-workbench-community
	#wget https://dev.mysql.com/get/mysql-apt-config_0.8.23-1_all.deb
	#sudo apt install -y ./mysql-apt-config_0.8.23-1_all.deb
	#sudo apt update

	# https://blockdev.io/mysql-workbench-ubuntu-20-04-and-app-armor/
	sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service
}


vnc_server() {
	step "===== Create vnc_server ====="

  sudo apt update && sudo apt install -y xfce4 xfce4-goodies && sudo apt install tightvncserver

  cat <<_EOD_  > ~vagrant/xstartup
#!/usr/bin/bash
xrdb \$HOME/.Xresources
startxfce4 &
_EOD_
chmod +x ~vagrant/xstartup
}

net_tools() {
	step "===== Create vnc_server ====="

  sudo apt update && sudo apt install -y net-tools
}

python3_dnf() {
	step "===== Create python3 dnf ====="

  sudo apt update && sudo apt install -y python3-dnf
}


#resolve_dns
#mariadb_server
#mysql_server
#vnc_server
#net_tools
python3_dnf