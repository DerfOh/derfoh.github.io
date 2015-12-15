---
layout: post
title: Remapping Caps to CTRL
categories: tips
tags: keymapping
published: True
date: 2015-12-15 11:57:11
---

Found this helpful tip in a [stack overflow](https://superuser.com/questions/949385/map-capslock-to-control-in-windows-10/997448#997448?newreg=2db99c78f27048eabada63e1006c5075) after trying to get the caps lock key disabled on my keyboard.
Simply open powershell as an administrator and run the following commands then reboot. Your annoying caps lock key will be remapped to a much more useful control key. 

`$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"}`

`$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout'`

`New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified)`