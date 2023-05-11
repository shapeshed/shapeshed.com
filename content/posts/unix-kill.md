+++
date = "2016-10-17T00:00:00+00:00"
description = "Tutorial on using kill, a UNIX and Linux command for terminating a process. Examples of killing a process, sending a SIGTERM, listing signal names and numbers, and handling 'operation not permitted' errors."
image = "images/covers/kill.png"
caption = "The UNIX and Linux kill command"
slug = "unix-kill"
tags = ["UNIX", "Linux"]
title = "Linux and Unix kill command tutorial with examples"
+++

## What is the kill command in UNIX?

The `kill` command is a command line utility to for terminating processes. It is
normally a [shell builtin][3] meaning the command is called from a users shell
rather than an external executable program. By default the `kill` command will
send a `TERM` signal to a process allowing the process to perform any cleanup
operations before shutting down. The kill command also supports sending any
other signal to a process. The kill command is used primarily to terminate or
restart processes.

## How to kill a process

To kill, or terminate a process first find out the process identifier number or
PID of the process to be killed, then pass the PID number to the kill command.
In the following example suppose that we are running the `mutt` terminal email
program and that we wish to terminate it. To find the process identifier the
[`ps`][5] command is used along with [`grep`][6] to find the PID.

```sh
ps -e | grep mutt
17146 pts/1    00:00:00 mutt
```

The same may also be achieved by running the `pgrep` command. This will return
the process identifier or identifiers for the search pattern.

```sh
pgrep mutt
17146
```

Once the PID for the mutt program is known it may be used with the `kill`
command.

```sh
kill 17146
```

This sends a `TERM` signal to the process indicating it should be terminated.
When a process receives a `TERM` it acts as a request to terminate the running
process. A UNIX process may catch a `TERM` and handle termination gracefully
such as releasing resources or saving state.

It is also possible to use `pkill` to achieve the same result.

```sh
pkill mutt
```

## How to (really) kill a process

If a process does not respond to a `TERM` signal the `KILL` signal may be used.
The `KILL` signal cannot be ignored by UNIX processes and the process is killed
immediately. Note that this does not allow the process to perform any cleanup
when shutting down the process. To send a process a signal other than `TERM` use
the `-s` option followed by the name of the signal.

```sh
kill -s KILL 17146
```

Using the signal number is more commonly used and is equivalent.

```sh
kill -s 9 17146
```

Some shell built-ins also support the following syntax for even more brevity.

```sh
kill -9 17146
```

## How to list signal names and numbers

To view signal names and numbers pass the `-L` option to the `kill` command.

```sh
kill -L
 1 HUP      2 INT      3 QUIT     4 ILL      5 TRAP     6 ABRT     6 IOT      7 BUS
 8 FPE      9 KILL    10 USR1    11 SEGV    12 USR2    13 PIPE    14 ALRM    15 TERM
16 STKFLT  17 CHLD    17 CLD     18 CONT    19 STOP    20 TSTP    21 TTIN    22 TTOU
23 URG     24 XCPU    25 XFSZ    26 VTALRM  27 PROF    28 WINCH   29 IO      29 POLL
30 PWR     31 UNUSED  31 SYS     34 RTMIN   64 RTMAX
```

To just list the names of signals use the `-l` option.

```sh
kill -l
    HUP INT QUIT ILL TRAP ABRT BUS FPE KILL USR1 SEGV USR2 PIPE ALRM TERM STKFLT CHLD CONT STOP TSTP TTIN TTOU URG XCPU XFSZ VTALRM PROF WINCH POLL PWR SYS
```

Any of these signals may be sent to a process using either the number or name of
a signal. The following are equivalent ways to send a process a `HUP` signal.

```sh
kill -s HUP 17146
kill -s 1 17146
kill -HUP 17146
kill -1 17146
```

## How to handle 'operation not permitted' errors

To kill a process a user account must have sufficient permissions. If, for
example, a normal user account tries to kill a process owned by root an error
will be shown. In the following example the process `6425` is owned by root.

```sh
kill 6245
kill: sending signal to 6245 failed: Operation not permitted
```

If the user account has sudo permissions the account can simultaneously be
elevated and run the command with the following.

```sh
sudo !!
```

If a user account does not have sudo permssions a systems administrator will
need to assign higher permissions to achieve this.

## How to show signals that are sent to a process

To enable verbose logging pass the `--verbose` flag to the `kill` command. Note
that this is not supported by all shell built-ins so may not be available on
your system.

```sh
kill --verbose 17146
sending signal 15 to pid 17146
```

The number relates to the signal mapped in the table of available signals
available via `kill -L`. In this case it is the `TERM` signal.

## Further reading

- [kill man page][1]
- [The kill command][7]
- [kill Wikipedia page][4]

[1]: http://linux.die.net/man/1/kill
[2]: /images/articles/kill.png "Linux and Unix kill command"
[3]: https://en.wikipedia.org/wiki/Shell_builtin
[4]: https://en.wikipedia.org/wiki/Kill_(command)#Unix_and_Unix-like
[5]: https://shapeshed.com/unix-ps/
[6]: https://shapeshed.com/unix-grep/
[7]: http://linfo.org/kill.html
