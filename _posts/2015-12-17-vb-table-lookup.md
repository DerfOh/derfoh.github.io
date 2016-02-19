---
layout: post
title: VB Table Lookup
categories: tips
tags: tips
published: True
comments: True
---

In my time  as a tutor I found that students struggled a lot with the concept of stepping through a multidemensional array. The concept of a table lookup is not necessarily the hardest thing to figure out but at the same time it takes a bit of thinking on the part of the programmer to conceptualize the logic behind it.
So the table looks somewhat like this:

|-----------------+------------+-----------------+-------------------|
|:----------------|-----------:|----------------:|------------------:|
| Our Part        |Brand A 	   | Brand B    	 | Brand C    	  	 |
|:----------------+------------:+-----------------:+----------------:|
| Our Part  1  	  | A1         | B1              | C1             	 |
|:----------------+------------:+-----------------:+----------------:|
| Our Part  2  	  | A2         | B2              | C2             	 |
|:----------------+------------:+-----------------:+----------------:|
| Our Part  3  	  | A3         | B3              | C3                |
|=================+============+=================+===================|
|  				  |            |                 |                	 |
|-----------------+------------+-----------------+-------------------|

In the case of this class the particular requirement of one of the applications the students make is that it has to go through an array of different parts made by different brands and it has to match that part up with the name of the part at the company. This lesson is a great way to introduce the capabilities of arrays as well as loops. I have also found that it is  a great way to introduce a student to Visual Studio's debugger.

So the real meat is the code that steps through this array:


{% highlight vb %}
For columninteger As Integer = 0 To numberOfColumns    'steps through every row, this value can be changed to fit your needs.
	For rowinteger As Integer = 0 To numberOfRows   'steps through every column, this value can be changed to fit your needs.
		If partsnumberstring(columninteger, rowinteger) = PartsTextBox.Text.ToUpper Then
		MessageBox.Show("Found part: " + partsnumberstring(columninteger, rowinteger) + "   --   Our Part: " + partsnumberstring(0, columninteger)) 'if the string matches put out the value in the first column
		End If
	Next
Next
{% endhighlight %}

what the code does is it steps through every column and row one by one cand compares the value in the text box that the user enters to the value found in that particular portion of the array. If the value matches the code outputs a message to the user that shows the part number they entered and the part number of the company's part that matches it.