#!/bin/bash

#This script is meant to create template.html if it does no already exists.
#Pollen source files that are written in an authoring mode (i.e., ".pmd" or ".pm" files) are rendered with a template. 
#It’s a file of the output type — e.g., CSS, HTML, XML — where you put the stuff that needs to be consistent between output files. 
#The template also contains template variables that mark where values from the Pollen source file should be inserted.
#When it needs a template, Pollen first looks for a file in the project directory named "template.[output extension of source]". 
#Thus, for "uptown.html.pm", the output extension will be ".html", and Pollen will first look for "template.html".
#Each user is welcome to modify the template of this script to suit their needs. In order to acjieve this 
#they need to modify the input of the echo command of below 'else'.
#Read more about Pollen: https://docs.racket-lang.org/pollen/quick-tour.html 
#

if [[ -f ./template.html ]]; then # 

echo -e "template.html already exists in this directory. Take a look at its content:\n"
cat ./template.html

else

echo '<html><head><meta charset="UTF-8"/></head>
<body style="background: #f6f6f6">
<div style="background: white; font-size: 250%; padding: 0.25em;">
This file is ◊here
<hr />
◊(->html ◊doc)
</div></body></html>'>template.html

fi

exit

