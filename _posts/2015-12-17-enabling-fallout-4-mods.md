---
layout: post
title: Enabling Fallout 4 Mods
categories: tips
tags: ['video games', 'mods', 'tips', 'fallout 4']
published: True
date: 2015-12-17 19:02:05
---

When making a custom skin for the popular game: [Fallout 4](http://store.steampowered.com/agecheck/app/377160/) I found that the mod would not load into the game until I tweaked a few things. Thanks to [this post](http://www.nexusmods.com/fallout4/videos/87/?) I found the values I needed to change in order to get things working.

>These edits are required for installed mods to work in your game.
You will need to add the following line to the `Fallout4Prefs.ini` file below the section marked 

~~~text
[Launcher]:
bEnableFileSelection=1
~~~

>You will need to change the following line in `Fallout4.ini`:

~~~text
sResourceDataDirsFinal=STRINGS\, TEXTURES\, MUSIC\, SOUND\, INTERFACE\, MESHES\, PROGRAMS\, MATERIALS\, LODSETTINGS\, VIS\, MISC\, SCRIPTS\, SHADERSFX\
~~~