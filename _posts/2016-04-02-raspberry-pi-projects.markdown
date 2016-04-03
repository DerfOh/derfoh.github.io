---
title: Raspberry Pi Projects
layout: post
categories: ["Raspberry Pi", "Projects"]
tags: ["projects"]
date: 2016-04-02 22:41:12
published: True
comments: True
---

If you live under a rock or just do not know what a Raspberry Pi is it is a small "Micro" computer that is relatively low cost that runs Linux operating systems such as Debian using an ARM processor.

I get asked a lot about what I use my Raspberry Pis for so I figured I would compile a list of the different projects and applications that I run on them.

I currently own 4 Pis. Two are Raspberry Pi 2s, One Raspberry Pi 1, and one Raspberry Pi 0.

For the Raspberry Pi 2s I use one as a dedicated VPN end point into my home network. The idea is that when I'm on the road I want to be able to tunnel my traffic through an encrypted connection back to my house then out to the Internet in an attempt to keep potential malicious actors from sniffing my traffic and doing what they will with it. I also have that Pi set up as a LAMP server for when I need to test a deployment of a website before I publish it onto the Internet. Along with the LAMP server and VPN I also have it set up as a client for the popular Lounge IRC client for when I need to get into an IRC room to ask questions or contribute to a conversation. Finally the last thing I use this Pi for is as a custom DNS server that blocks advertisements for all the devices on my home network using the Pi-Hole application.

The other Pi 2 is being used as a Retro Pi/Kodi System. Essentially it is a conglomeration of many popular video game system emulators for when I am seeking out some of that sweet nostalgic gaming from yesteryear. Kodi also adds a very flexible and powerful media center application. I use this for a mainly watching Movies/TV, youtube, twitch streams, and podcasts. It also acts as an RSS reader and keeps me informed on what the weather is in a few different locations. This Pi also runs an SMB server so that any device on the network can access any saved media files on it for their own.

The Raspberry Pi 1 is being used as a hub for a couple cameras. I use this as a home security system that takes still images whenever it detects motion. It then sends me a digest in an email daily of what it captured.

Finally I am still working on what I want to do with the Raspberry Pi 0. I have played with the idea of using it as an on the go DNS black-hole for blocking advertisements when I'm on the road. I'm sure I will come up with a practical use for it that capitalizes on its extremely small form factor.

Here's a compiled list of all the tools/applications used with the pis:

* [Open VPN](https://github.com/Nyr/openvpn-install)
* [PI LAMP Server Tutorial](http://elinux.org/RPi_A_Simple_Wheezy_LAMP_install)
* [The Lounge IRC Client](https://github.com/thelounge/lounge)
* [Pi-Hole Ad Blocker](https://pi-hole.net/)
* [Retro Pi](https://github.com/retropie/retropie-setup/wiki)
* [Kodi](http://mymediaexperience.com/raspberry-pi-xbmc-with-raspbmc/)
* [Motion Eye](https://github.com/ccrisan/motioneye/wiki/Install-On-Raspbian)

If you have any further questions regarding my setup feel free to leave me a comment below! 