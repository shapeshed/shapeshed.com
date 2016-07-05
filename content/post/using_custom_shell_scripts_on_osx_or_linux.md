{
  "layout": "post",
  "title": "Using custom shell scripts on OSX or Linux",
  "date": "2009-05-03T00:00:00+01:00",
  "description": "Custom shell scripts allow you to do pretty much anything. Here's a short tutorial on how to set up either OSX or Linux so you can use custom shell scripts on your system.\n",
  "tags": [
    "OSX",
    "Linux"
  ]
}
## Configuring your environment

I'm assuming here that you are on a POSIX compliant system (namely OSX or Linux). First let's make sure we are in our home directory. On OSX or Linux in a terminal run:  

 cd 

Standard practice is to keep user shell scripts in a bin folder in your home directory. You may or may not have this folder depending on your operating system. If it doesn't exist create it: 

    mkdir bin 

So on OSX the folder path will be /Users/george/bin. On Linux it will be /home/george/bin. Remember 'george' will be whatever your username is.

## Ensuring bin is in your path

To be able to use the shell scripts from our bin folder we need to make sure that this folder is in the $PATH variable. The shell looks in this folder when you issue a command.

If you are comfortable with vi use these commands. If you are not comfortable with vi you can use [textedit][1] in OSX or gedit on Linux. 

    cd #change to home directory 
    vi .bash_profile 

Add the following line to this file 

    PATH=$PATH:$HOME/bin 

For the changes to take effect you need to reload your profile. I'm assuming you are still in your home directory. 

  . ./.bash_profile 

## Adding scripts

Now we can just drop shell scripts into the bin folder. To use them we must make sure they are executable: 

    chmod +x yourshellscript.sh 

That's it. Now you can call your shell script from the command line using 

    yourshellscript.sh 

## Related reading

*   [Shell Script - Wikipedia][2]
*   [Shell Scripting Primer][3]
*   [OS X: Change your PATH environment variable][4]
*   [HOWTO: Add a Directory to my Path Statement/Variable][5]

 [1]: http://www.tech-recipes.com/rx/2618/os_x_easily_edit_hidden_configuration_files_with_textedit/
 [2]: http://en.wikipedia.org/wiki/Shell_script
 [3]: http://developer.apple.com/documentation/opensource/Conceptual/ShellScripting/index.html
 [4]: http://www.tech-recipes.com/rx/2621/os_x_change_path_environment_variable/
 [5]: http://www.everyjoe.com/newlinuxuser/howto-add-a-directory-to-my-path-statementvariable/
