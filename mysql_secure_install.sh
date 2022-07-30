#!/usr/bin/bash

  MYSQL_ROOT_PASSWORD='Password@123'
  #MYSQL=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $11}')
  MYSQL="$MYSQL_ROOT_PASSWORD"

  #SECURE_MYSQL=$(expect -c "
  expect <<EOD

  set timeout 10
  spawn mysql_secure_installation

  expect "Enter current password for root (enter for none):"
  send "\r"
  expect "Set root password? \[Y/n\]"
  send "n\r"
  expect "Remove anonymous users? \[Y/n\]"
  send "n\r"
  expect "Disallow root login remotely? \[Y/n\]"
  send "n\r"
  expect "Remove test database and access to it? \[Y/n\]"
  send "n\r"
  expect "Reload privilege tables now? \[Y/n\]"
  send "n\r"
  expect eof
EOD
exit
  expect \"Change the password for root ?\ ((Press y\|Y for Yes, any other key for No) :|Change the root password? [Y/n]\"
  send "y\r"
  send \"$MYSQL\r\"
  expect \"New password:\"
  send \"$MYSQL_ROOT_PASSWORD\r\"
  expect \"Re-enter new password:\"
  send \"$MYSQL_ROOT_PASSWORD\r\"
  expect \"Do you wish to continue with the password provided?\(Press y\|Y for Yes, any other key for No) :\"
  send \"y\r\"
  expect \"Remove anonymous users?\(Press y\|Y for Yes, any other key for No) :\"
  send \"y\r\"
  expect \"Disallow root login remotely?\(Press y\|Y for Yes, any other key for No) :\"
  send \"n\r\"
  expect \"Remove test database and access to it?\(Press y\|Y for Yes, any other key for No) :\"
  send \"y\r\"
  expect \"Reload privilege tables now?\(Press y\|Y for Yes, any other key for No) :\"
  send \"y\r\"
  expect eof
 EOD
 # ")

 # echo $SECURE_MYSQL