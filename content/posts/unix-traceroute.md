+++
date = "2016-09-13T00:00:00+00:00"
description = "Tutorial on using traceroute, a UNIX and Linux command for showing the route packets take to a network. Examples of tracing a route, using IPv6, disabling hostname mapping and setting the number of queries per hop."
image = "images/articles/traceroute.png"
slug = "unix-traceroute"
tags = ["UNIX", "Linux"]
title = "Linux and Unix traceroute command tutorial with examples"
+++

![A terminal showing the traceroute man page][2]

## What is the traceroute command in UNIX?

The `traceroute` command shows how a data transmission travelled from a local
machine to a remote one. A typical example would be loading a web page. Loading
a web page over the internet involves data flowing through a network and a
number of routers. The `traceroute` command can show the route taken and the IP
and hostnames of routers on the network. It can be useful for understanding
latency or diagnosing network issues.

## How to trace the route to a network host

To trace the route to a network host pass the ip address or name of the server
you want to connect to.

```sh
traceroute google.com
traceroute to google.com (172.217.23.14), 30 hops max, 60 byte packets
 1  10.8.8.1 (10.8.8.1)  14.499 ms  15.335 ms  15.956 ms
 2  h37-220-13-49.host.redstation.co.uk (37.220.13.49)  17.811 ms  18.669 ms  19.346 ms
 3  92.zone.2.c.dc9.redstation.co.uk (185.20.96.137)  19.096 ms  19.757 ms  20.892 ms
 4  203.lc3.redstation.co.uk (185.5.3.221)  28.160 ms  28.415 ms  28.665 ms
 5  100.core1.the.as20860.net (62.128.218.33)  26.739 ms  27.840 ms  28.847 ms
 6  110.core2.thn.as20860.net (62.128.218.26)  29.112 ms  18.466 ms  19.835 ms
 7  be97.asr01.thn.as20860.net (62.128.222.205)  19.986 ms  20.488 ms  21.354 ms
 8  * * *
 9  216.239.48.143 (216.239.48.143)  24.364 ms 216.239.48.113 (216.239.48.113)  25.069 ms  25.592 ms
10  108.170.233.199 (108.170.233.199)  26.239 ms  27.369 ms  28.031 ms
11  lhr35s01-in-f14.1e100.net (172.217.23.14)  28.642 ms  29.311 ms  29.815 ms
```

The output shows a number of things:

- The first line shows the hostname and ip that is to be reached, the maximum
  number of hops to the host that `traceroute` will attempt and the size of the
  byte packets to be sent.
- Then each line lists a hop to get to the destination. The hostname is given,
  followed by the ip of the hostname, followed by the roudtrip time that it
  takes for a packet to get to the host and back to the initiating computer.

By default `traceroute` sends three packets for each host so three response
times are listed.

To demonstrate seeing increased latency the following example runs the same
command whilst connected to a VPN in Australia. The route is different and takes
much longer.

```sh
traceroute google.com
traceroute to google.com (172.217.25.46), 30 hops max, 60 byte packets
 1  10.8.8.1 (10.8.8.1)  316.212 ms  316.393 ms  317.031 ms
 2  107.181.128.1 (107.181.128.1)  322.328 ms  326.666 ms  326.872 ms
 3  au-sy3-bdr-0-0.as58940.net.au (43.245.167.1)  321.205 ms  326.474 ms  327.065 ms
 4  as15169.nsw.ix.asn.au (218.100.52.3)  327.626 ms  327.762 ms  328.033 ms
 5  216.239.43.157 (216.239.43.157)  328.232 ms 216.239.47.81 (216.239.47.81)  328.427 ms 216.239.43.157 (216.239.43.157)  328.631 ms
 6  108.170.233.193 (108.170.233.193)  328.817 ms 108.170.233.195 (108.170.233.195)  316.259 ms  317.409 ms
 7  syd15s02-in-f14.1e100.net (172.217.25.46)  317.079 ms  321.961 ms  322.113 ms
```

The following example shows a `traceroute` that fails to reach the destination.

```sh
traceroute google.com
traceroute to google.com (172.217.25.46), 30 hops max, 60 byte packets
 1  10.8.8.1 (10.8.8.1)  316.212 ms  316.393 ms  317.031 ms
 2  107.181.128.1 (107.181.128.1)  322.328 ms  326.666 ms  326.872 ms
 3  au-sy3-bdr-0-0.as58940.net.au (43.245.167.1)  321.205 ms  326.474 ms  327.065 ms
 4 * * *
 5 * * *
 6 * * *
 7 * * *
...
```

In this example the asterisks show packet loss. This could mean a network
outage, high amounts of traffic leading to network congestion or a firewall
dropping traffic. Whatever the reason the `traceroute` command shows the
destination is not reached.

## How to trace the route using IPv6

To trace the route to a network host using the IPv6 protocol pass the `-6`
option.

```sh
traceroute -6 ipv6.google.com
```

## How to disable IP address and hostname mapping.

To disable IP address mapping in `traceroute` use the `-n` option.

```sh
traceroute -n google.com
traceroute to google.com (172.217.23.14), 30 hops max, 60 byte packets
 1  10.8.8.1  14.692 ms  15.529 ms  15.976 ms
 2  37.220.13.49  18.429 ms  19.559 ms  20.153 ms
 3  185.20.96.137  19.123 ms  19.897 ms  20.721 ms
 4  185.5.3.221  24.759 ms  25.124 ms  25.868 ms
 5  62.128.218.33  26.558 ms  27.244 ms  28.342 ms
 6  62.128.218.26  28.929 ms  18.275 ms  18.448 ms
 7  62.128.222.205  19.139 ms  22.730 ms  22.148 ms
 8  * * *
 9  216.239.48.113  20.806 ms 216.239.48.143  18.909 ms 216.239.48.113  19.382 ms
10  108.170.233.199  19.516 ms 108.170.233.197  19.853 ms  19.884 ms
11  172.217.23.14  19.893 ms  19.449 ms  19.496 ms
```

## How to set the number of queries per hop

To set the number of queries per hop in `traceroute` use the `-q` option.

```sh
traceroute -q 1 google.com
traceroute to google.com (172.217.23.14), 30 hops max, 60 byte packets
 1  10.8.8.1 (10.8.8.1)  14.845 ms
 2  h37-220-13-49.host.redstation.co.uk (37.220.13.49)  16.874 ms
 3  92.zone.2.c.dc9.redstation.co.uk (185.20.96.137)  16.683 ms
 4  203.lc3.redstation.co.uk (185.5.3.221)  20.784 ms
 5  100.core1.the.as20860.net (62.128.218.33)  21.280 ms
 6  110.core2.thn.as20860.net (62.128.218.26)  22.071 ms
 7  be97.asr01.thn.as20860.net (62.128.222.205)  22.890 ms
 8  *
 9  216.239.48.143 (216.239.48.143)  24.815 ms
10  108.170.233.199 (108.170.233.199)  25.175 ms
11  lhr35s01-in-f14.1e100.net (172.217.23.14)  25.812 ms
```

## How to set response wait time

To configure the response wait time in `traceroute` use the `-w` option. The
supports specifying how long to wait in seconds for a response to a probe. In
the following example this is set to one second.

```sh
traceroute -w 1 google.com
```

## How to specify the interface to use

To set the network interface that `traceroute` should use use the `-i` option.
If this is not set the interface is selected according to the routing table.

```sh
traceroute -i wlp3s0b1 google.com
```

## Further reading

- [traceroute man page][1]
- [traceroute Wikipedia page][3]
- [Understanding the ping and traceroute commands][4]
- [What is traceroute][5]
- [Using traceroute][6]

[1]: http://linux.die.net/man/8/traceroute
[2]: /images/articles/traceroute.png "Linux and Unix ps command"
[3]: https://en.wikipedia.org/wiki/Traceroute
[4]:
  https://www.cisco.com/c/en/us/support/docs/ios-nx-os-software/ios-software-releases-121-mainline/12778-ping-traceroute.html
[5]: http://whatismyipaddress.com/traceroute
[6]: http://www.exit109.com/~jeremy/news/providers/traceroute.html
