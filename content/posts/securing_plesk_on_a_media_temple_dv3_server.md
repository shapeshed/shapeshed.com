{
  "title": "Securing Plesk on a Media Temple (dv)3 server",
  "date": "2008-01-18T00:00:00+00:00",
  "description": "By taking a few simple steps with SSH, FTP and the firewall you can make your Plesk server more secure than the default configuration.",
  "tags": [
    "Media Temple",
    "Plesk",
    "Linux"
  ]
}

This information is provided as advice only. No responsibility will be taken for following this advice. 

## Secure SSH

By default the SSH port number is 22. If you look at your logs you will see a large number of brute force attacks on that port. Changing the port number is a simple way to make your server more secure. To change the port number login as root and run the following command: 

    vi /etc/ssh/sshd_config

Find the line: 

    Port 22

Change this line to another port number above 1024. Using a port number above 1024 prevents scans like nmap picking up ssh. 

Next we want to use the more secure SSH 2 protocol. On the line underneath the port number set the protocol to 2 

    Protocol 2

Save the sshd_config file and then restart sshd: 

    /etc/init.d/sshd restart

Now when you login via Plesk you will need to specify the custom port. In the example below the custom port has been set to 3456. 

    ssh user@123.456.789.10 -p 3456

For additional security you should disable direct root access to your server. Media Temple has a [good walk through][1] on this so I won't write this up here.

## Configure Plesk's Firewall

If you don't feel comfortable editing the Firewall via the command line you can do it through Plesk's interface. Go to Modules > Firewall. If you have a static IP address you can create rules so that the server will only allow access from your IP. For the custom SSH port 3456 the following two rules will only allow access from the IP 123.456.789.10 

    Allow incoming from 123.456.789.10 on port 3456/tcp 
    Deny incoming from all on port 3456/tcp


## SFTP

Secure FTP is more secure than FTP in that it is uses SSH. To use this you need to enable it in Plesk for each account. In the setup page select /bin/bash(chrooted) under "Shell access to server with FTP user's credentials". This user will now be able to login over SFTP. Dont' forget that if you have changed the SSH port you will need to specify the custom port in your FTP client when you connect. If you are sure you don't want users to login over standard FTP you should block this via the firewall.  

    Deny incoming from all on ports 21/tcp, 21/udp

You can further secure your FTP server if you have a static IP by allowing access only from your IP. If your static IP is 123.456.789.10 Under the FTP Server rule add: 

    Deny incoming from all on ports 21/tcp, 21/udp

## Hide your server

By default your server can be pinged by anyone, meaning it is discoverable. You can improve security by changing the firewall to only allow known IP addresses to ping your server. If your static IP is 123.456.789.10 change the rules under Ping Service: 

    Allow incoming from 123.456.789.10 
    Deny incoming from all others 

Have tips that aren't listed here? Please leave a comment below!

 [1]: http://kb.mediatemple.net/article.php?id=713
