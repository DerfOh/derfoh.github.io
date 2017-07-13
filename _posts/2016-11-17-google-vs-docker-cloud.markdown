---
title: "Google Cloud Platform and Docker Cloud"
layout: post
categories: ["check-in", "reflections"]
tags: ["tips", "reviews"]
title: "Google vs Docker Cloud"
date: "2016-11-17 00:20:07 -0500"
published: false
---

I am sure many will agree that I have only started to dip my toes in the water of cloud containers but I find that my experiences between Docker Cloud and Kubernetes/Google Cloud to be very different.

### Google Cloud Platform

* The good

	* There are free containers that you can use. Google offers up to 3 containers in their repository that they will host for free. This actually comes at a cost for Docker Cloud along with the added cost of the hosting for that container.

	* You get the satisfaction and utility of a tried and true containerized service delivery platform that will not have any decline in support in the foreseeable future.

* The bad

	* You are pretty much locked into using Linux/Mac. If you're a windows person the Kubernetes tools aren't the easiest to set up and get going. You can easily get around this however if you are comfortable with running a virtual machine and if you're working with containers you're already more likely to be developing off of one of these systems anyway.

    * I found the toolkit to be multi layered and complex. This added onto the already complex nature of container technology was a bit too much added informational overhead. It took almost 2 whole hours and a few different reference documents to get something similar to a docker container running on one of the nodes. The process involved creating a cluster, then going onto a Linux machine to build and push the docker image to Google cloud. Once the image was there I had to then install the Kubernetes toolkit locally on my machine so that I could see a ui in which I deployed the docker image. This was entirely confusing as I didn't understand why Google could not have just hosted that on their own systems rather than making me do additional unnecessary configuration.


### Docker Cloud

* The good

	* The integration with the Docker hub repository is seamless. I can push an image that I built locally up to the repository, then as soon as changes are detected the image is then redeployed on the server.

    * Host integration was very easy for me. I use digital ocean for most of my personal needs and creating a dedicated docker droplet was very easy to do. Their documentation was very strait forward and made it very easy for me to integrate the two providers in a very conventional way. Along with this integration Docker Cloud automatically provisions and manages scaling up your infrastructure in a very simple and strait forward interface.

    * Triggers, environment variables, and everything else you can imagine is easily configured from their dashboard. I found that Kubernetes didn't even come close to scratching the surface of configurable that the Docker Cloud ui had brought to the table.


* The bad

	* The added overhead cost is one thing that always gets to me with Docker Cloud. Not only do I have to pay for the service, the private repositories for Dockerhub, but I also have to pay for the server along with it all. This whole stack can add up to quite a big chunk of cash if you get carried away with the amount of projects and sites you're hosting with this setup.

    * Docker is a relatively new product in comparison to the engineering that goes on at Google. It is still in it's infancy too. It is still very rare to see large sites running their infrastructure from Docker Cloud so there are really no well defined best practices for doing it. Finally with being new means there are bound to be large changes yet in the development pipeline. These changes while good may also bring along with them volatile reliability for the service.

In retrospect I am most comfortable using Docker Cloud for my provisioning and management of my containers. The most valuable aspect for me is how easily the interface blends all of the essential functions of docker in a way that just really makes sense even for someone who is relatively new to the whole concept of containerized services and systems. While I do recognize that things may change in their core technology I am willing to take on the additional overhead for the possibility of them creating something that can stand up to the well established industry giants like AWS and Google Cloud Platform.
