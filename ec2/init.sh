#!/bin/bash

echo "Inside EC2"
sudo yum update -y
echo "install apache"
sudo yum install -y httpd
sudo systemctl start httpd
sudo mkdir /var/www/html
sudo touch /var/www/html/index.html
ip=$(hostname -I | awk '{print $1}')
echo "<p1> Hello World from $ip </p1>" >> /var/www/html/index.html
