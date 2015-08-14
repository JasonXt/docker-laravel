#!/bin/bash

echo "starting hhvm"
service hhvm start

echo "starting nginx"
service nginx start

echo "starting ssh (ssh is the only service keeping this container alive)"
exec /usr/sbin/sshd -D