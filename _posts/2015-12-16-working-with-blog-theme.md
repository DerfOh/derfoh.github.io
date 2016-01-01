---
layout: post
title: Working with blog theme
categories: check-in
tags: theming
published: True
date: 2015-12-16 19:43:53
comments: True

---

I had a heck of a time figuring out how to theme jekyll. You'd think there would be just one css file to edit but you would be very wrong. Apparently themes for Jekyll are an issue and are not very consistent in their implementation. Furthermore the things you might be seeing as local changes when building the site locally do not show up on github's build of the site. I wasn't aware that build errors get sent to your email so it was good that I learned that. Something as simple as changing the font color in the highlighted fields has proven to be very difficult however. It even took me a bit to figure out how to get the title of the blog to a different color. I persevered though in at least changing the color of the site's title.

It seems that the file I need to edit in my directory is in the `_sass` folder, the themes then seem to be laid out in a similar fashion to a regular css file but it looks like there are variables that can be set in the `css\main.scss` file. This has been my first encounter with Sass files and find it intreguiing that you can use CSS in this way. There are a few more tweaks I'd like to do You can find more about this language at <http://sass-lang.com/>

I also found a great resource for the type of markdown my Jekyll implementation is using (called kramdown) at <http://kramdown.gettalong.org/syntax.html>

Now that I have the site looking mostly how I want it to I am going to be working towards making more posts about the projects that I have currently on GitHub and go over their purpose, and if I expect to expand upon them.