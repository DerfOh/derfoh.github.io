---
title: "My Windows + Linux Toolkit"
layout: post
categories: ["check-in", "reflections"]
tags: ["podcasts", "tips", "entertainment"]
date: "2016-11-13 09:11:51 -0500"
published: True
comments: True
---

## Intro
Lately I have been developing extensive amounts of golang code for an API that I am writing for a course for my Project management course and the code is to be deployed to a linux VPS. I also have started up a new job as a part time Linux Systems Administrator and many of my projects involve implementing LDAP login to a Linux based web applications. Due to both of these things I must constantly jump between Windows and Linux on a daily basis.

The API sits on the same VPS as a SQL server and interacts with it by sending database instructions to it and returns JSON data to the client that is sending the requests. [It's still under development but the project can be found here.](http://github.com/derfoh/compromise)

## The toolkit
The goal of this post is to outline the toolkit that I use on a daily basis to work on Linux and Windows consecutively.

![AtomImage](/images/posts/atomImage.png)
### Atom

Atom is my editor of choice here for most of my work in developing and editing configurations. Not only is it cross-platform but has a huge amount of packages that are actively maintained by the community. Oh and did I mention that it is [https://github.com/atom](OpenSource)?
The pluggins are really where atom shines as you can star these pluggins on their central repository [atom.io](http://atom.io) and then with one simple command: `apm install --stars` the command line utility goes out and finds your pluggins and loads them into your environment. Then for any individual configurations I simply use a secret github repo or a hidden gist to get the editor into it's findal state. The real beauty of being able to do these things is that no matter what system or where I am working from I am actually able to carry over most if not all of my customized editing environment without a lot of the weight that tends to come with other editors and IDEs.

You can see all of the pluggins I use by checking out my [atom.io profile](https://atom.io/users/DerfOh/stars). Many of them are related to specific projects that I am working on. Most notably the ones that I have for golang do things such as code completion, automated testing, linting, go to definitions, and a variety of other amazing features that generally make developing go code a breeze.

![VimImage](/images/posts/VimIMage.png)
### Vim

I would be remiss if I didn't take the time to write something about Vim (or vim-enhanced). If Atom was to be my car, vim would be my skateboard. I use the editor almost as much as Atom but generally in smaller increments and swift actions from the command line. It is frequently how I compose my commit messages and any time I need to work on a configuration or just a one off file I often reach for Vim as it is quicker for me and I don't have to rely on Atom loading up, being installed, or having the proper configurations. While I have spent the time playing with a variety of plugins for Vim, I simply do not need to add the extra cruft to an already perfectly engineered tool.

![GitImage](/images/posts/GitImage.png)
### Git and GitHub

Git is indispensable not only as a utility for tracking changes, deploying code, and allowing for a collaborative workflow. It also is an awesome way to synchronize your workspace and projects across multiple systems. It seems like more and more I find myself with a terminal open somewhere at any moment on my PC that is sitting in a particular project's directory.


![cmderImage](/images/posts/cmderImage.png)
### cmder

cmder is an amazing utility when it comes to using the command line on windows. Not only does it do mintty, it also does bash, powershell, windows cmd, and even ssh. There are multiple tabs you can work from. A million settings to tweak it just how you like it. Plugin support. Cmder even lets you use it in 'quake mode' where it comes down from the top of your screen in a fashion that any oldschool PC gamer would appreciate.


![MobaImage](/images/posts/MobaImage.png)
### MobaXTerm

Sometimes keeping track of all my SSH endpoints and keys can be a real pain. MobaXterm acts is an excellent utility that frees me from the grips of PuTTY. I do not use it beyond that function though. I know that even the personal edition does more than I use it for. I really only have use for the personal edition but there is a paid version that allows for a whole extra suite of tools and utilities that can be used as well.


![VirtualBoxImage](/images/posts/VirtualBoxImage.png)
### VirtualBox

I have had a long love-hate relationship with dual booting between Windows and Linux. I finally have thrown in the towell and adopted a virtualized solution. VirtualBox allows me to take the base image of the distribution that my code will eventually live on and develop specifically to that environment. I can even combine this methodology with vagrant and docker to make a powerful develop and deliver 1-2 punch. I use this design flow especially when I am working on some kind of microservice or other single purpose type application. It is really nice being able to jump between projects just by hopping in and out of virtual machines.

![UbuntuImage](/images/posts/UbuntuImage.png)
### Ubuntu MATE

Ubuntu MATE is my preferred distribution for a general desktop and development environment. I mainly deploy my personal projects to Ubuntu servers. Ubuntu has done a great job of making Linux a friendly and easy to learn thing through a tasteful design and release methodology and especially due to the amazingly supportive community. The amount of guides and resources that are available for Ubuntu is fantastic too. The MATE desktop environment delivers that classic Gnome feel that I got accommodated to when I was originally cutting my teeth on Linux.
