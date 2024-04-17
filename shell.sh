#!/bin/bash
read -p "enter your region:" region
if [ -z $region ]; then
    echo "please give a valid input"
else
    check=$(curl -sl https://ec2.$region.amazonaws.com/)
    if [ -z "${check}" ]; then
        echo "invalid region"
    else
        echo "your region is $region"
        aws ec2 describe-vpcs --region $region | jq .Vpcs[].VpcId
    fi
fi


#!/bin/bash
read -p "enter your region:" region
if [ -n $region ]; then
    check=$(curl -sl https://ec2.$region.amazonaws.com/)
    if [ -n "${check}" ]; then
        echo "invalid region"
    else
        echo "your region is $region"
        aws ec2 describe-vpcs --region $region | jq .Vpcs[].VpcId
    fi
    else
        echo "please give a valid input"S
fi
