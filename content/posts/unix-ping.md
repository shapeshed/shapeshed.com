+++
date = "2016-08-25T00:00:00+00:00"
description = "Tutorial on using ping, a UNIX and Linux command for sending ICMP ECHO_REQUEST packets to network hosts. Examples of checking if a remote host is up and limiting to IPv4 and IPv6 requests."
image = "images/articles/ping.png"
slug = "unix-ping"
tags = ["UNIX", "Linux"]
title = "Linux and Unix ping command tutorial with examples"
+++

![A terminal showing the ping man page][2]

## What is the ping command in UNIX?

The `ping` command sends ICMP ECHO_REQUEST packets to network hosts and reports
on the response from the remote server, outputting to standard output. It can be
used to check if a remote host is up, or that network interfaces can be reached.
It is frequently used to check whether a network connection is available between
one machine and another. The `ping` command is useful for testing whether a
remote server is available, checking your own network connection and verifying
network issues.

## How to check a remote host is up

To check a remote host is up using the `ping` command pass the hostname or ip of
the remote server you are interested in communicating with.

```sh
ping bbc.co.uk
PING bbc.co.uk (212.58.244.22) 56(84) bytes of data.
64 bytes from 212.58.244.22 (212.58.244.22): icmp_seq=1 ttl=53 time=130 ms
64 bytes from 212.58.244.22 (212.58.244.22): icmp_seq=2 ttl=53 time=130 ms
64 bytes from 212.58.244.22 (212.58.244.22): icmp_seq=3 ttl=53 time=130 ms
^C
--- bbc.co.uk ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 130.145/130.182/130.225/0.417 ms
```

The command will continue running until you hit CTRL+C. Using the `ping` command
in this way can also be useful as a quick and dirty way to see if the machine
the command is being run from has a network connection.

## How to limit the number of packets sent

To limit the number of packets sent use the `-c` option. This causes `ping` to
exit after sending the number of `ECHO_REQUEST` packets specified.

```sh
ping -c 2 guardian.co.uk
PING guardian.co.uk (23.235.33.233): 56 data bytes
64 bytes from 23.235.33.233: icmp_seq=0 ttl=56 time=47.729 ms
64 bytes from 23.235.33.233: icmp_seq=1 ttl=56 time=31.187 ms
```

```sh
--- guardian.co.uk ping statistics ---
2 packets transmitted, 2 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 31.187/39.458/47.729/8.271 ms
```

## How to check IPv4 only

To check IPv4 using `ping` pass the `-4` option. This can be useful for checking
whether an IPv4 interface is up.

```sh
ping -4 google.com
PING google.com (172.217.4.174) 56(84) bytes of data.
64 bytes from lax28s01-in-f174.1e100.net (172.217.4.174): icmp_seq=1 ttl=55 time=9.01 ms
64 bytes from lax28s01-in-f174.1e100.net (172.217.4.174): icmp_seq=2 ttl=55 time=9.15 ms
^C
--- google.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1001ms
rtt min/avg/max/mdev = 9.013/9.082/9.152/0.117 ms
```

## How to check IPv6 only

To check IPv6 using `ping` pass the `-6` option. This can be useful for checking
the configuration of an IPv6 interface.

```sh
ping -6 google.com
PING google.com(nuq04s29-in-x0e.1e100.net (2607:f8b0:4005:801::200e)) 56 data bytes
64 bytes from nuq04s29-in-x0e.1e100.net (2607:f8b0:4005:801::200e): icmp_seq=1 ttl=57 time=1.37 ms
64 bytes from nuq04s29-in-x0e.1e100.net (2607:f8b0:4005:801::200e): icmp_seq=2 ttl=57 time=1.50 ms
^C
--- google.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1002ms
rtt min/avg/max/mdev = 1.370/1.439/1.508/0.069 ms
```

## How to add a timestamp before each line

To add a timestamp before each line pass the `-D` option. This causes `ping` to
add a UNIX timestamp to the start of each line. This can be useful to document
the time of day that network tests were completed.

```sh
ping -D google.com
PING google.com(nuq04s29-in-x0e.1e100.net (2607:f8b0:4005:801::200e)) 56 data bytes
[1472109939.583350] 64 bytes from nuq04s29-in-x0e.1e100.net (2607:f8b0:4005:801::200e): icmp_seq=1 ttl=57 time=1.37 ms
[1472109940.584020] 64 bytes from nuq04s29-in-x0e.1e100.net (2607:f8b0:4005:801::200e): icmp_seq=2 ttl=57 time=1.45 ms
^C
--- google.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1001ms
rtt min/avg/max/mdev = 1.371/1.413/1.456/0.056 ms
```

## Further reading

- [ping man page][1]
- [Ping Tutorial: 15 Effective Ping Command Examples][3]
- [Linux and Unix ping command][4]

[1]: http://linux.die.net/man/8/ping
[2]: /images/articles/ping.png "Linux and Unix ping command"
[3]:
  http://www.thegeekstuff.com/2009/11/ping-tutorial-13-effective-ping-command-examples/
[4]: http://www.computerhope.com/unix/uping.htm
