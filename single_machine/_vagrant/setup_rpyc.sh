#! /bin/bash

sudo apt-get -y install python-pip
pip install rpyc

cat > /etc/init/rpyc.conf <<EOF
description     "Vagrant RPyC"

start on runlevel [2345]
stop on runlevel [06]

exec start-stop-daemon --start --pidfile /var/run/rpyc.pid --exec  /bin/sh -- -c "HOME=/root /usr/local/bin/rpyc_classic -m forking"

EOF

service rpyc stop || true
service rpyc start
