#!/bin/bash
#checking the status of the folder
if [ -d /tmp/testfolder ]; then
    echo "folder exits"
    if [ -f /tmp/testfolder/terraform_1.8.0_linux_amd64.zip ]; then
        echo "file exits"
    else
        cd /tmp/testfolder
        echo "removing terraform file if already exits..."
        rm -f terraform
        echo "downloading terraform now ...."
        wget -q https://releases.hashicorp.com/terraform/1.8.0/terraform_1.8.0_linux_amd64.zip
        unzip -q terraform_1.8.0_linux_amd64.zip 
        rm -f terraform_1.8.0_linux_amd64.zip
        ./terraform version
        ls -al /tmp/testfolder
    fi
else
    mkdir /tmp/testfolder
    if [ -f /tmp/testfolder/terraform_1.8.0_linux_amd64.zip ]; then
        echo "file exits"
    else
        cd /tmp/testfolder
        echo "removing terraform file if already exits..."
        rm -f terraform
        echo "downloading terraform now ...."
        wget -q https://releases.hashicorp.com/terraform/1.8.0/terraform_1.8.0_linux_amd64.zip
        unzip -q terraform_1.8.0_linux_amd64.zip
        rm -f terraform_1.8.0_linux_amd64.zip
        ./terraform version
        ls -al /tmp/testfolder
    fi
fi
