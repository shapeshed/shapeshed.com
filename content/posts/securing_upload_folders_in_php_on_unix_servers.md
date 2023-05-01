+++
date = "2006-05-02T00:00:00+01:00"
description = "On many sites upload folders are set to 777 permissions. For many developers this is the easiest and quickest way of allowing Content Management Systems to upload files to the server. A more secure method is too use 755 permissions."
tags = ["PHP"]
title = "Securing upload folders in PHP on Unix Servers"
+++

Please note this is for advanced users only - no responsibility will be taken
for this going wrong

## What does chmod 777 mean?

Chmod 777 means that anyone can read, write and execute scripts in the specified
folder on your server. So it means that anyone connected to the interent can
write a file to the folder on your server and then execute it.

## Chmod 755

Chmod 755 improves security on upload folders by limiting write access to the
user of the folder. If you specify the user as the user running Apache / PHP
this means that scripts executed by PHP will be able to write to the folder.
This is perfect for uploading files.

## How to do it

Firstly you'll need root access to your server. If you don't have root access
ask your hosts. They will either tell you that you can't have it or they will
give you the details.

Ensure that php is not running in safe mode. Ask your hosts. If it is you can
stop it running in safe mode by accessing your sever as root via SSH and typing.

```sh
perl -p -i -e 's/safe_mode\s*=\s*on/safe_mode = off/i;' /etc/php.ini [hit enter]
    /etc/init.d/httpd stop [hit enter]
    /etc/init.d/httpd start [hit enter]
```

Then browse to the folder one above your upload directory. Change the upload
directory and all folders within the directory to 755 by typing

```sh
chmod -R 755 youruploaddirectory
```

Then you need to change the owner name of the folder and all folders within the
upload folder to the name running Apache and PHP. This is usually "www",
"apache" or "nobody." Ask your hosting company if you are unsure. Then type

```sh
[root@yourservername] chown -R apache youruploaddirectory
```

This should complete the process. You can test your upload permissions by
uploading a file. It should only work when apache completes the process.

Of course this method is not totally secure. The only way of having total
security is to not be connected to the internet.
