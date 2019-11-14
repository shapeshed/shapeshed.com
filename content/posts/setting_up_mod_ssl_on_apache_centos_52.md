{
  "slug": "setting-up-mod-ssl-on-apache-centos-52",
  "title": "Setting up mod_ssl on Apache Centos 5.2",
  "date": "2008-07-28T00:00:00+01:00",
  "description": "This tutorial will explain how to set up a site over https on Centos 5.2, although it should work on most linux distributions. The tutorial uses a self signed key so will work well for a personal website or testing purposes. This is provided as is so proceed at your own risk and take backups!",
  "tags": [
    "Linux",
    "Apache"
  ]
}

## Getting the required software

For an SSL encrypted web server you will need a few things. Depending on your install you may or may not have OpenSSL and mod_ssl, Apache's interface to OpenSSL.

Use yum to get them if you need them.

yum install mod_ssl openssl 

Yum will either tell you they are installed or will install them for you.

## Generate a self-signed certificate

Using OpenSSL we will generate a self-signed certificate. If you are using this on a production server you will need a key from Trusted Certificate Authority, but if you are just using this on a personal site or for testing purposes a self-signed certificate is fine. To create the key you will need to be root so you can either su to root or use sudo in front of the commands 

    openssl genrsa -out ca.key 1024 # Generate private key 

    # Generate CSR 
    openssl req -new -key ca.key -out ca.csr

    # Generate Self Signed Key
    openssl x509 -req -days 365 -in ca.csr -signkey ca.key -out ca.crt

    # Move the files to the correct locations
    mv ca.crt /etc/pki/tls/certs
    mv ca.key /etc/pki/tls/private/ca.key
    mv ca.csr /etc/pki/tls/private/ca.csr

Then we need to update the Apache SSL configuration file 

    vi +/SSLCertificateFile /etc/httpd/conf.d/ssl.conf 

Change the paths to match where the Key file is stored. If you've used the method above it will be  

    SSLCertificateFile /etc/pki/tls/certs/ca.crt 

Then set the correct path for the Certificate Key File a few lines below. If you've followed the instructions above it is: 

    SSLCertificateKeyFile /etc/pki/tls/private/ca.key 

Quit and save the file and then restart Apache 

    /etc/init.d/httpd restart 

All being well you should now be able to connect over https to your server and see a default Centos page. As the certificate is self signed browsers will generally ask you whether you want to accept the certificate. Firefox 3 won't let you connect at all but you can override this.

## Setting up the virtual hosts

Just as you set virtual hosts for http on port 80 so you do for https on port 433. A typical virtual host for a site on port 80 looks like this 

    <VirtualHost *:80>
            <Directory /var/www/vhosts/yoursite.com/httpdocs>
            AllowOverride All
            </Directory>
            DocumentRoot /var/www/vhosts/yoursite.com/httpdocs
            ServerName yoursite.com
    </VirtualHost>

To add a sister site on port 443 you need to add the following at the top of your file  

    NameVirtualHost *:443 

and then a VirtualHost record something like this: 

    <VirtualHost *:443>
            SSLEngine on
            SSLCertificateFile /etc/pki/tls/certs/ca.crt
            SSLCertificateKeyFile /etc/pki/tls/private/ca.key
            <Directory /var/www/vhosts/yoursite.com/httpsdocs>
            AllowOverride All
            </Directory>
            DocumentRoot /var/www/vhosts/yoursite.com/httpsdocs
            ServerName yoursite.com
    </VirtualHost>

Restart Apache again using  

    /etc/init.d/httpd restart 

You should now have a site working over https. If you can't connect you probably need to open the port on your firewall: 

    iptables -A INPUT -p tcp --dport 443 -j ACCEPT /sbin/service iptables save iptables -L -v 
