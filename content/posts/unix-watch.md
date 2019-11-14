{
  "slug": "unix-watch",
  "title": "Linux and Unix watch command tutorial with examples",
  "date": "2017-07-12T00:00:00+00:00",
  "image": "images/articles/watch.png",
  "description": "Tutorial on using watch, a UNIX and Linux command for executing a program periodically and showing a fullscreen output. Examples of watching a file download, a network interface come up, and showing the five most CPU intensive processes.",
  "tags": [
    "UNIX",
    "Linux"
  ]
}

![Terminal showing ps man page][2]

## What is the watch command in UNIX?

The `watch` command runs a given command repeatedly and displays the output, refreshing the screen with each interval. This allows a command to be watched and produces functionality similar to the `top` command. The command will run until terminated, usually with CTRL-C. The watch command is very useful for generating a real-time view of events that are happening on an operating system. 

## Watching a file download

In this example an large file is being downloaded via a browser. Using watch the download folder can be monitored to see if the download has completed.

    watch -n 0.5 ls -a /isos

The `-n` option sets the interval at which the screen refreshes in seconds. In this case it is set to half a second. 

Of course for downloading isos you would be much better off using a torrent if you can!

## Watching a network interface come up

In this example a wireless network connection is enabled and a connection is established. Using `watch` a real-time of the connection being established and an ip address being assigned can be seen. The following command will refresh every 0.5 seconds.

    watch -n 0.5 ip a

The command will refresh as the and update connection is established and eventually it shows the connection is up and the ip address is assigned.

    2: wlp3s0: <BROADCAST,MULTICAST> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
      link/ether fe80::fe80:fe80:fe80:fe80 brd ff:ff:ff:ff:ff:ff

    2: wlp3s0: <NO-CARRIER,BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state DORMANT group default qlen 1000
      link/ether fe80::fe80:fe80:fe80:fe80 brd ff:ff:ff:ff:ff:ff
      inet6 fe80::fe80:fe80:fe80:fe80/64 scope link tentative
      valid_lft forever preferred_lft forever
                       
    2: wlp3s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
      link/ether fe80::fe80:fe80 brd ff:ff:ff:ff:ff:ff
      inet6 fe80::fe80:fe80:fe80:fe80/64 scope link tentative
      valid_lft forever preferred_lft forever

    2: wlp3s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
      link/ether fe80::fe80:fe80:fe80:fe80 brd ff:ff:ff:ff:ff:ff
      inet 192.168.43.53/24 brd 192.168.43.255 scope global wlp3s0
      valid_lft forever preferred_lft forever
      inet6 fe80::fe80:fe80:fe80:fe80/64 scope link
      valid_lft forever preferred_lft forever

In this example using `watch` is a much more efficient way of seeing whether a connection is up than repeatedly running `ip a` or pinging some external site.

## Showing the most CPU intensive processes

The [`ps`][4] can show detailed information on running processes. When combined with the [`sort`][5] and [`head`][6] commands it can provide a snapshot of processes at a single point in time.

The following provides a snapshot of the most intensive CPU processes. 

    ps aux | sort -nrk 3,3 | head -n 5

This is a good example of a where the `watch` command makes something much more useful. By using the `watch` command the command can be turned in a real-time `top` like view of CPU intensive. If you are running Google Chrome you will probably see all five processes coming from Chrome!
    
    watch "ps aux | sort -nrk 3,3 | head -n 5"

## Further reading 
* [watch man page][1]
* [How to use the watch command][3]

[1]: https://linux.die.net/man/1/watch
[2]: /images/articles/watch.png "Linux and Unix watch command"
[3]: http://www.linfo.org/watch.html
[4]: https://shapeshed.com/unix-ps/
[5]: https://shapeshed.com/unix-sort/
[6]: https://shapeshed.com/unix-head/
