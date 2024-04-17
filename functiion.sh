#!bin/bash

function testfun1 {
    echo "getting the s3 list.."
    aws s3 ls | cut -d " " -f 3
}

testfun() {
    aws ec2 describe-vpcs | jq ".vpcs[].vpcid" | tr -d '"' | tee /tmp/vpcs-$(date --uts +%y%m%d_%H%H%SZ0)
}

testfun1
testfun

#!/bin/bash
delete_vols() {
vols=$(aws ec2 describe-volumes | jq ".volumes[].volumeId" | tr -d '"')
for vol in $vols; do
    size=$(aws ec2 describe-volumes --volume-idsn $vol | jq ".volumes[].size")
    if [ $size -gt 10 ]; then
        echo "its prod volume. dont delete"
    else
        echo "deleting volume $vol"
    fi
done
}
delete_vols