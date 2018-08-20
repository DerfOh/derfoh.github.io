---
layout: post
categories: ["tips", "tutorias"]
tags: ["tips", "tutorias"]
title: "Install docker and jenkins on ubuntu server"
date: "2018-08-19 21:00 -0500"
published: True
comments: True
---

# Intro
Quick reference post for installing docker and jenkins on ubuntu server.

# install-jenkins.sh

```bash
#!/usr/bin/env bash

echo "Adding key and packages list"
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -

echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list

echo "Updating lists"
sudo apt-get update

echo "Installing jenkins"
sudo apt-get install -y default-jdk jenkins
```

# install-docker.sh
```bash
#!/usr/bin/env bash

echo "Adding key and packages list"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo "Updating lists"
sudo apt-get update

echo "Installing Docker"
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo systemctl status docker

echo "Adding Jenkins to docker group"
sudo usermod -aG docker jenkins
```

Now you're good to go setting up a docker pipeline!