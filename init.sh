#!/bin/bash

echo "Remove java 1.7 and install java 1.8"
sudo yum remove java-1.7.0-openjdk -y
sudo yum install java-1.8.0 -y
sudo yum update –y
echo "Add jenkins repo, import key and install jenkins"
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
echo "Start jenkins service and add service at boot-up"
sudo service jenkins start
sudo chkconfig jenkins on
