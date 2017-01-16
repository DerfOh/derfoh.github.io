---
layout: post
categories: ["tips", "tutorias"]
tags: ["tips", "tutorias"]
title: "Automated golang Deployments"
date: "2017-01-15 21:00 -0500"
published: "false"
---

# Intro
In this post I am going to attempt to outline the process that I have successfully used to automatically test and deploy golang web applications to a production ready cloud environment using Docker, CircleCi, GitHub, and Digital Ocean. 

Using Docker as a contianerization service as well as an orchestration layer has allowed me to support clustering and scaling of my web applications in a seamless manor.

When coupled with a continuous integration service like CircleCi I have been able to perform deploys using just a single code commit that include end to end testing for the applications for each deploy. 

# Setting up a golang web app

# Connecting github and CircleCi
## Writing a circle.yml

## Authorize CircleCi to access github repo

# Connecting docker and CircleCi
## Writing a Dockerfile

## Connecting docker cloud and docker hub

## Configuring dockerhub service

