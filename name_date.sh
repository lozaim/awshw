#!/bin/bash
sleep 30
sudo yum update -y
sudo yum install -y httpd.x86_64 jq curl
sudo systemctl enable httpd.service
PrivateIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
sudo bash -c 'echo "This image with $PrivateIP has $(uname -mrs) and it create at $(date) "> /var/www/html/index.html'
sudo systemctl start httpd.service