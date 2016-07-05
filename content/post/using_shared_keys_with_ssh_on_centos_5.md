{
  "layout": "post",
  "title": "Using Shared Keys with SSH on Centos 5",
  "date": "2008-02-27T00:00:00+00:00",
  "description": "Shared Keys add an additional security level to using SSH and if you choose not to use a password you can automate logging in via SSH. It also allows you to completely negate brute force password cracking attempts if you disable password authentication. ",
  "tags": [
    "Linux"
  ]
}

This tutorial assumes a basic knowledge of the Linux Command Line. The tutorial is written for Centos 5.1 but is applicable to other distributions, although file locations may be slightly different. The tutorial is targeted at Mac and Linux users. Windows users can find resources [ here][1]. The usual disclaimer applies - no responsibility can be accepted for following this tutorial so if you do not know what you are doing please do not use this tutorial. 

## What are shared keys?

Shared Keys consist of a Public and Private key and allow a remote machine to authenticate a machine trying to connect it. The Private key resides on your machine and is used to identify you against the public key which resides on the machine you are trying to login to. You might think of it as a handshake. The remote machine has a description of what to expect from the handshake. It is unique to the client machine so if the handshake doesn't match then the authentication will fail.

## Why use shared keys?

Shared keys have two main benefits. Firstly they allow you to turn off password authentication. Malicious bots regularly crawl the web trying to login to servers using SSH. They have large dictionaries of passwords and try to get into your server using brute force attacks. You can limit this by having a strong password and changing the port that you use to login to SSH with. You can also completely turn off password authentication if you use shared keys. Shared keys mean that no one can access your server without the shared key. 

The second benefit is that if you use scripts to backup your server to another one you do not need passwords to run the scripts. The scripts can just use the shared keys to authenticate. 

## How to do it

On my Mac I'm logged in as the user myuser. On the remote machine I also login using the user myuser. On my Mac I open Terminal (you'll find this in Applications > Utilities). First I need to generate the keys on my machine. I run this command: 

    ssh-keygen -t rsa

You will be prompted for a password. If you don't want a password just hit return. This means however that anyone who gets control of your machine will be able to login to your server. This generates a public and a private key in a hidden folder /Users/myuser/.ssh

It is possible that you won't be able to see hidden files on your Mac by default. If this is the case you can enable this across your system by running the commands 

    defaults write com.apple.finder AppleShowAllFiles TRUE 
    killall Finder 

Now on the remote machine login as your user using your normal password. In your home directory (/home/myuser in this example) create a new folder and then a file to hold your authorized keys.  

    mkdir .ssh 
    cd .ssh 
    touch authorized_keys

Now we copy the public key to the server using the scp command. This transfers the file using SSH so is secure as no one can see it. You will be asked for your regular password.  

    scp ~/.ssh/id_rsa.pub myuser@7123.456.789.0:~/

Now SSH into your remote server in the standard way and in your home directory (/home/myuser in this example) you will see the file id_rsa.pub. We want to import this into our list of authorized keys so on the remote machine run this command.  

    cat id_rsa.pub >> ~/.ssh/authorized_keys

This writes the contents of the key to our authorized keys list. Once you are done we want to clean things up and set permissions on the files to ensure that no one can else can use our key. On the remote machine: 

    rm id_rsa.pub 
    chmod 700 ~/.ssh 
    chmod 600 ~/.ssh/authorized_keys

On the local machine 

    chmod 700 ~/.ssh 
    chmod 600 ~/.ssh/id_rsa 

You should now be set up to access your machine with your shared key. Login as normal and if all goes to plan you will be granted access with your key. You can debug logging in by adding the verbose flag to your SSH request. 

    ssh -v myuser@123.456.789.0 

Once you are sure everything is ok you can now disable password logins for addtional security. On the remote machine you will need root access and run the following commands 

    vi /etc/ssh/sshd_config 

Find the line  

    PasswordAuthentication yes 

Change this to no. Then hit escape : wq to save the file. Finally restart the sshd daemon: 

    /etc/init.d/sshd restart 

You will now only be able to login to your server using a shared key.

 [1]: http://blog.juvely.com/2007/01/05/howto-svnssh-with-multiple-users-and-password-less-logins-part-2/
