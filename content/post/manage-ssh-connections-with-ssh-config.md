{
    "title": "Manage SSH connections with a SSH config file",
    "date": "2016-07-19T06:39:27+01:00",
    "description": "Using an SSH config file is another way that UNIX can simplify your workflow.",
    "tags": [
      "SSH",
    "UNIX"
      ]
}
## SSH Connections

If you are making anything on the web before long you will find yourself using `SSH`. SSH allows you to connect to and work on remote servers.

    ssh -p 8675 hercules@foo.com

## Using a SSH Config File

If you find yourself frequently running SSH commands you may get the urge to create an [alias][5] for the command. In fact there is a better way to manage SSH options using an SSH config file. This file can be located in your home directory at `~/.ssh/config` or be made available system wide at `/etc/ssh/ssh_config`. If the file does not exist you can create it and set the correct permissions.

    touch ~/.ssh/config
    chmod 644 ~/.ssh/config.

For the simple example above we can create an entry in this file.

    Host foo.com
      HostName foo.com
      Port 8675
      User hercules

This allows the following to be run and for the options to be automatically set.

    ssh foo.com

## Setting an identity key

If you are using shared keys to login to SSH without having to use a password you can declare the key in your SSH config. This can be useful if you are connecting to different servers that have different shared keys.

    Host foobar.com
        User horatio
        HostName foobar.com
        IdentityFile ~/.ssh/foobar.key

## Setting defaults

You can set defaults for all SSH connections by declaring an entry at the bottom of your config file. 

    Host *
         ForwardAgent no
         ForwardX11 no
         ForwardX11Trusted yes
         User shapeshed
         Port 22
         Protocol 2

## Debugging 

To debug your setup run SSH in verbose mode to see the settings that are applied

    ssh -v foobar.com

This will show which configuration settings are applied.

    ♣  ssh -v foobar.com
    OpenSSH_6.9p1, LibreSSL 2.1.8
    debug1: Reading configuration data /Users/shapeshed/.ssh/config
    debug1: /Users/shapeshed/.ssh/config line 5: Applying options for foobar.com
    debug1: /Users/shapeshed/.ssh/config line 9: Applying options for *
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: /etc/ssh/ssh_config line 20: Applying options for *
    debug1: /etc/ssh/ssh_config line 102: Applying options for *
    debug1: Connecting to foobar.com [123.456.789.000] port 8675.

## Security

Personally I do not store my SSH config file in source control or in my [dotfiles][1]. Effectively an SSH config file declares route into servers and how to get into them so I recommend not making this information public.

## Conclusion

Using an SSH config file is another way that using UNIX can simplify your workflow. For more I recommend reading the [man page][2].

## Further Reading

* [Simplify Your Life With an SSH Config File][3]
* [OpenSSH Config File Examples][4]
* [ssh\_config man page][2]

[1]: https://github.com/shapeshed/dotfiles
[2]: http://linux.die.net/man/5/ssh_config
[3]: http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/
[4]: http://www.cyberciti.biz/faq/create-ssh-config-file-on-linux-unix/
[5]: http://tldp.org/LDP/abs/html/aliases.html
