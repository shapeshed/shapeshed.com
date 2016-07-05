{
  "layout": "post",
  "title": "Prevent your SSH connection from freezing",
  "date": "2008-06-11T00:00:00+01:00",
  "description": "Recently I was finding that my SSH connection to a Media Temple (dv) Centos 5 server was freezing. Creating a local config file fixed it. For anyone else suffering the same problem here's how to do it. ",
  "tags": [
    "Media Temple",
    "Linux"
  ]
}

## The Issue

I'm on Mac OSX 10.5 connecting to a Centos 5 box using Terminal. I'm using shared keys and the connection was fine and working well until I left the Terminal window idle for over 15 seconds. I was also finding that SFTP sessions via Transmit would regularly freeze. All of this was very annoying and frustrating.

## The solution

I discovered that through creating a local config file for ssh you can declare settings that fix this and many other issues. Remember I'm on a Mac OSX 10.5 here. The usual disclaimer applies - this article is unsupported and you make changes at your own risk.

Open terminal and get going: 

    cd /Users/yourname/.ssh

    # If you get ""-bash: cd: .ssh: No such file or directory"
    # You need to create it
    mkdir /Users/yourname/.ssh

    # Set security on the folder so only you can read, write and execute
    chmod 700 /Users/yourname/.ssh

    # Change directory
    cd .ssh

    # Create the config file
    touch config

    # Edit the config file
    vi config

    # When in vi hit i to enter insert mode and add the following lines to the config file
    ServerAliveCountMax 3
    ServerAliveInterval 10

    # Save and quit by hitting :wq

    # Set correct permissions on the config file
    chmod 644 /Users/yourname/.ssh/config

Now try connecting via SSH and this should stop your SSH sessions freezing. This instantly fixed the issue for me anyway. Hopefully it might help a few other people.

## Other uses

Through reading the documentation I discovered it is also possible to set configuration on a per user basis for SSH. You can set compression, the port number you are connecting to, specific settings for hostnames and much more. 

If you are using SSH on a daily basis having a quick read of the documentation - is likely to throw up a few useful things you can put into a config file.

## Further reading

*   [All SSH Parameters][1]
*   [Getting Started with SSH][2]
*   [OpenSSH][3]

 [1]: http://www.openbsd.org/cgi-bin/man.cgi?query=ssh_config
 [2]: http://kimmo.suominen.com/docs/ssh/
 [3]: http://www.openssh.org/
