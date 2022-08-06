#!/usr/bin/bash

mypasswd="${1}"
mypasswd="uci2020"

echo "${mypasswd}" | vncpasswd -f > /home/vagrant/.vnc/passwd

chown vagrant: /home/vagrant/.vnc/passwd
chmod 0600 /home/vagrant/.vnc/passwd
