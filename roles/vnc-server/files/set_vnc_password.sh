#!/usr/bin/bash

mypasswd="uci2020"

echo "${mypasswd}" | vncpasswd -f > ${HOME}/.vnc/passwd

chmod 0600 ${HOME}/.vnc/passwd
