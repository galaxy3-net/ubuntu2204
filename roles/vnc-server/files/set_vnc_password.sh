#!/usr/bin/bash

myuser="vagrant"
mypasswd="uci2020"

echo "${mypasswd}" | vncpasswd -f > ${HOME}/$myuser/.vnc/passwd

chmod 0600 /home/$myuser/.vnc/passwd
