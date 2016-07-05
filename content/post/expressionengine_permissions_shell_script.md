{
  "layout": "post",
  "title": "ExpressionEngine permissions shell script",
  "date": "2009-05-03T00:00:00+01:00",
  "description": "Every ExpressionEngine install requires that a number of permissions are set on folders and files. Here's a shell script to do the hard work for you. ",
  "tags": [
    "OSX",
    "Linux",
    "ExpressionEngine"
  ]
}

## Download

If you are comfortable using shell scripts you can [download the file here][1]. The file sets all the necessary permissions on a default installation of ExpressionEngine and allows you to specify a custom system folder name if you have set one. If you are not comfortable using shell scripts I've written a [how to article for OSX and Linux][2].

## Script usage

To use the script change directory to the root of your ExpressionEngine install and run: 

    exp_permissions.sh 

You'll be asked for the system folder name. If you have changed this for any reason enter it here. If you have not changed it just hit return.

If all goes well you won't see anything. If for any reason the script cannot find the folders it will tell you.

## What it does

The script sets file permssions as detailed on the [ExpressionEngine installation page.][3]

## License

The script is licensed under an [Apache License, Version 2.0][4].

 [1]: http://cdn.shapeshed.com/downloads/exp_permissions.sh
 [2]: http://shapeshed.com/using_custom_shell_scripts_on_osx_or_linux/
 [3]: http://expressionengine.com/docs/installation/installation.html
 [4]: http://www.apache.org/licenses/LICENSE-2.0
