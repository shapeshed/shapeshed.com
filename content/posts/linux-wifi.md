+++
date = "2016-09-12T00:00:00+00:00"
description = "Tutorial on configuring wifi in Linux using wpa_supplicant. Examples of scanning for networks, configuring a network, connecting to a network and saving configuration."
image = "images/articles/wpa_supplicant.png"
slug = "linux-wifi"
tags = ["Linux"]
title = "Configuring wifi in Linux with wpa_supplicant"
+++

![Terminal showing wpa_supplicant man page][2]

## How do I configure wifi using wpa_supplicant?

The `wpa_supplicant` command supports the configuration and administration of
wireless networks on Linux. First the wireless network interface needs to be
discovered using the `ip` command. Then the `wpa_supplicant` daemon can be
started. Finally a client like `wpa_cli` can be used to connect to the daemon
and configure the interface.

## How to discover the network interface

In order to configure wireless connectivity on Linux the network interface is
needed .To discover the network interface use the `ip` command. Running `ip a`
will show all of the network interfaces on the machine.

```sh
ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: wlp3s0b1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 1000
    link/ether 20:c9:d0:86:5b:99 brd ff:ff:ff:ff:ff:ff
```

The wireless interface on this machine is `wlp3s0b1`. Generally the wireless
interface will start with 'w'. If the wireless interface is not present and the
machine has a wireless card it is possible that the driver for the wireless card
is not installed.

## How to use wpa_supplicant

The `wpa_supplicant` tool can configure network interfaces and connect to
wireless networks. It is intended to run as a daemon and other command to
connect it. A basic configuration is as follows.

```sh
ctrl_interface=DIR=/run/wpa_supplicant GROUP=wheel
update_config=1
```

On the first line `GROUP=wheel` allows any user in the `wheel` group to connect
to an manage wireless connections. To limit wireless connectivity to the root
account remove this. This file should be created as root and saved in the
`/etc/wpa_supplicant` directory. The file may be called anything but for this
example it is called `example.conf`. Once this file is created `wpa_supplicant`
may be started by running the following command as root.

```sh
wpa_supplicant -B -i wlp3s0b1 -c /etc/wpa_supplicant/example.conf
Successfully initialized wpa_supplicant
```

The `-B` option runs the daemon in the background. The `-i` option specifies the
network interface to use. This is the interface name discovered using the `ip`
command. The `-c` options specifies the configuration file to be used.

## How to interact with wpa_supplicant using wpa_cli

The `wpa_cli` command can be used to interact with `wpa_supplicant`. It can be
used to query current status, change configuration, trigger events, and request
interactive user input. If the `GROUP=wheel` option is set in the
`wpa_supplicant` configuration the command may be run by users in the `wheel`
group. If not it must be run as root.

```sh
wpa_cli
wpa_cli v2.5
Copyright (c) 2004-2015, Jouni Malinen <j@w1.fi> and contributors

This software may be distributed under the terms of the BSD license.
See README for more details.


Selected interface 'wlp3s0b1'

Interactive mode

>
```

Once launched the tool will be in interactive mode.

## How to scan for networks using wpa_cli

To scan for networks using `wpa_cli` at the interactive prompt first run `scan`.

```sh
> scan
OK
<3>CTRL-EVENT-SCAN-STARTED
<3>CTRL-EVENT-SCAN-RESULTS
<3>WPS-AP-AVAILABLE
<3>CTRL-EVENT-NETWORK-NOT-FOUND
```

Once the `CTRL-EVENT-SCAN-RESULTS` event has been received run `scan_results`.

```sh
> scan_results
bssid / frequency / signal level / flags / ssid
7c:4c:a5:68:25:69       2412    7       [WPA2-PSK-CCMP][WPS][ESS]       SKY1DA97
92:d3:f7:4d:47:00       2437    7       [WPA-EAP-CCMP+TKIP][WPA2-EAP-CCMP+TKIP][ESS] BTWifi-X
a8:d3:f7:4d:47:06       2437    7       [WPA2-PSK-CCMP][WPS][ESS]       BTHub5-H9MS
f4:f2:6d:85:6d:bf       2412    7       [WPA-PSK-CCMP+TKIP][WPA2-PSK-CCMP+TKIP][WPS][ESS]     SKY43B9E
00:50:7f:eb:1c:40       2462    7       [WPA-PSK-CCMP+TKIP][WPA2-PSK-CCMP+TKIP][ESS] MYNETWORK
```

The results list five columns and allow the available networks to be seen. The
flags column is particularly useful showing the security model for the network.

## How to connect to a network using wpa_cli

To connect to a network using `wpa_cli` first add a new network and then set the
`SSID` and `passphrase`.

```sh
> add_network
0
> set_network 0 ssid "MYNETWORK"
> set_network 0 psk "secret"
```

The `ssid` value related to the `ssid` value discovered during the scan. The
`psk` value is the pre-shared key for the wireless network. Once these
parameters are set the network is ready to use.

```sh
> enable_network 0
0K
<3>CTRL-EVENT-SCAN-STARTED
<3>CTRL-EVENT-SCAN-RESULTS
<3>WPS-AP-AVAILABLE
<3>SME: Trying to authenticate with 00:50:7f:eb:1c:40 (SSID='MYNETWORK' freq=2462 MHz)
<3>Trying to associate with 00:50:7f:eb:1c:40 (SSID='MYNETWORK' freq=2462 MHz)
<3>Associated with 00:50:7f:eb:1c:40
<3>WPA: Key negotiation completed with 00:50:7f:eb:1c:40 [PTK=CCMP GTK=TKIP]
<3>CTRL-EVENT-CONNECTED - Connection to 00:50:7f:eb:1c:40 completed [id=0 id_str=]
```

The network interface is now up as can be seen using `ip a`.

```sh
ip a
2: wlp3s0b1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 20:c9:d0:86:5b:99 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.13/24 brd 192.168.1.255 scope global wlp3s0b1
       valid_lft forever preferred_lft forever
    inet6 fe80::fb6f:882f:5323:c3d1/64 scope link
       valid_lft forever preferred_lft forever
```

The connection can be verified by pinging a server on the internet.

```sh
ping google.com
PING google.com (216.58.198.110) 56(84) bytes of data.
64 bytes from lhr25s07-in-f110.1e100.net (216.58.198.110): icmp_seq=1 ttl=51 time=11.6 ms
64 bytes from lhr25s07-in-f110.1e100.net (216.58.198.110): icmp_seq=4 ttl=51 time=11.2 ms
```

If there is a response the wifi network is active.

## How to save wpa_supplicant configuration

To save `wpa_configuration` using `wpa_cli` use `save_config` at the interactive
prompt.

```sh
> save config
OK
```

Examining the configuration file shows that the network configuration has been
written to the file.

```sh
cat /etc/wpa_supplicant/example.conf
ctrl_interface=DIR=/run/wpa_supplicant GROUP=wheel
update_config=1

network={
        ssid="MYNETWORK"
        psk="secret"
}
```

Now if the machine is rebooted `wpa_supplicant` can be started as before and it
will connect to the `MYNETWORK` wireless network.

```sh
wpa_supplicant -B -i wlp3s0b1 -c /etc/wpa_supplicant/example.conf
```

## Further reading

- [wpa_supplicant man page][1]
- [ip man page][3]
- [wpa_supplicant Arch Linux Wiki][4]
- [wpa_supplicant Wikipedia page][4]

[1]: http://linux.die.net/man/8/wpa_supplicant
[2]: /images/articles/wpa_supplicant.webp "Linux wpa_supplicant command"
[3]: http://linux.die.net/man/8/ip
[4]: https://wiki.archlinux.org/index.php/WPA_supplicant
[5]: https://en.wikipedia.org/wiki/Wpa_supplicant
