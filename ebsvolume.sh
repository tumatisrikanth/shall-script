#!/bin/bash
# creation of edsvolume in different availability zones
azs=('us-east-1a' 'us-east-1b' 'us-east-1c')
I=1
for az in ${azs[@]}; do
    aws ec2 create-volume --volume-type gp2 --size 1 --availability-zone $az \
    --tag-specifications 'resourcetype=volume,tags=[{key=name,value=EBSVOL-'${I}
    I=$((I+1))
    sleep 1
done
