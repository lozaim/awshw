#!/bin/bash

########################################
##### USE THIS WITH AMAZON LINUX 2 #####
########################################
#LOL#
# get admin privileges
#sudo su

# install httpd (Linux 2 version)
yum update -y
yum install -y httpd.x86_64
yum install -y jq
systemctl start httpd.service
systemctl enable httpd.service
mkdir  /root/.aws/
touch /root/.aws/config
touch /root/.aws/credentials
echo -e "[default]\nregion = us-east-2\noutput = json" > /root/.aws/config
echo -e "[default]\naws_access_key_id = AKIAYJH5OR4LWEP5UB6U\naws_secret_access_key = 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" > /root/.aws/credentials


subnets=`aws ec2 describe-subnets --region use-east-2 | jq '.Subnets[].SubnetId'`
echo "Network list is ${subnets}" > /var/www/html/index.html
