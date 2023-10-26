#!/bin/bash
sudo su
apt-get update
apt-get install nginx -y
echo "Hi lokman response from $(hostname)" > /var/www/html/index.html
service nginx start