#!/bin/bash
#using the special operators to find the specific region vpcs and vpcids
regions=$@
echo $regions
for region in $regions; do
    aws ec2 describe-Vpcs --region $region | jq .Vpcs[].Vpc.Id
    if [ $? -eq 0 ]; then
        echo "region $region is valid"
    else
        echo "region $region is invalid"
    fi
    echo "================"
done
echo "you have given $# region as input"
