#!/usr/bin/bash

mypasswd="uci2020"

echo "${mypasswd}" | vncpasswd -f > /home/vagrant/.vnc/passwd

chmod 0600 /home/vagrant/.vnc/passwd
