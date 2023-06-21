#! /bin/bash
IMAGE_ID=$(aws ec2 describe-images --filters Name=name,Values=kostis-demo | jq -r .Images[0].ImageId)
aws ec2 run-instances --image-id $IMAGE_ID --count 1 --no-cli-pager --instance-type t2.micro --security-group-ids sg-077847d2f63340b3f --user-data file://scripts/startup.sh --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=from-packer}]'