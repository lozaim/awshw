#!/bin/bash

########################################
##### USE THIS WITH AMAZON LINUX 2 #####
########################################
##

subnets=`aws ec2 describe-subnets --region us-east-2 | jq '.Subnets[].SubnetId'`
echo "Network list is ${subnets}" > /var/www/html/index.html