{
  "layout": "post",
  "title": "Using Aliases in the Linux Shell",
  "date": "2008-07-11T00:00:00+01:00",
  "description": "Creating aliases to use in the command line is a simple way to increase productivity and shows the simplicity and power of using the shell. Here's how to do it.",
  "tags": [
    "Linux"
  ]
}
This tutorial is written for Centos 5.2 and bash, but should work on most linux distributions. 

## What is an alias?

An alias is just another term for something. It is the same for the command line. You can specify any name you like for a command so for example if you do not like using 'ls' to show you everything in a folder you can change it to 'showme' or 'ilovedancingnaked'. Whatever you like in fact. 

## Why bother?

The simple answer is that it will save you time. Take this example. Let's say that each time I list the contents of a folder I use 'ls -lhF'. It is my preference that I see the long listing format, in human readable format and that the output classifies the listing. If this is a persistent preference I can use an alias to make it permanent.

## How to do it

To create an alias you will need to login to your home directory. Run 'ls -a' and you should see a hidden file .bash_profile. This is the file we need to add the alias to. So let's edit that file: 

    vi bash_profile 

Then we add the alias - you can add this anywhere in the file.  

    alias ls='ls -lhF' 

Quit and save by hitting ':wq'. Then we need to reload the profile 

    source .bash_profile 

All done! Now whenever you use the 'ls' command the .bash_profile file will override the default options and return the options that you have specified in the alias, so you'll see a human readable directory listing without having to add the flags

You can use aliases in many ways - this is just a very simple example.
