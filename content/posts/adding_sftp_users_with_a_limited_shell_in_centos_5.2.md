+++
date = "2008-12-04T00:00:00+00:00"
description = "A quick way to add SFTP users with a limited shell in CentOS"
tags = ["Linux"]
title = "Adding SFTP Users with a limited Shell in CentOS 5.2"

+++

## FTP or SFTP?

FTP is an insecure protocol and is open to packet sniffing so where possible I prefer to use SFTP on a custom port. Closing off the standard FTP port also limits risk to the box.

SFTP requires a standard Linux account which means that users can log into the box via SSH. Most of the time this is ok but sometimes you don't want this. How can you limit what user accounts can do but still grant SFTP access?

## The quick and dirty way

There are a few options to limit user accounts. The simplest is to change the SFTP user's shell to use the sftp server as a shell. In order to do this as root edit `/etc/shells` and add `/usr/libexec/openssh/sftp-server`.

Then for the SFTP user change their shell to the SFTP server 

    chsh -s /usr/libexec/openssh/sftp-server yoursftpuser 

This means that the user will be able to use the SFTP server but nothing else.

The downside is that the user will still be able to traverse the entire file system when connected. Chrooting is [a feature][1] of OpenSSH from version 4.8p1. The version that comes with CentOS is 4.3p2

On a production box manually compiling a newer version is not an option for me.

## Other options

[scponly][2] acts as an alternative shell to limit what users can do. You can configure users to be chrooted.

[rssh][3] is restricted shell for use with OpenSSH which only allows scp. It doesn't provide chrooting but there are other ways to do it.

## Conclusion

Because packages are always behind the latest release on CentOS there isn't an elegant solution to this without manually compiling packages. The solution offered by OpenSSH is exactly what is required, so I suppose I'll wait.

 [1]: http://undeadly.org/cgi?action=article&sid=20080220110039
 [2]: http://www.sublimation.org/scponly/wiki/index.php/Main_Page
 [3]: http://rssh.sourceforge.net/
