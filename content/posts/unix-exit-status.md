+++
date = "2016-08-07T00:00:00+00:00"
description = "Tutorial on using exit codes from Linux or UNIX commands. Examples of how to get the exit code of a command, how to set the exit code and how to suppress exit codes."
image = "images/covers/unix-exit-code.png"
caption = "Exit codes in Unix and Linux"
slug = "unix-exit-codes"
tags = ["UNIX", "Linux"]
title = "Linux and Unix exit code tutorial with examples"
+++

## What is an exit code in the UNIX or Linux shell?

An exit code, or sometimes known as a return code, is the code returned to a
parent process by an executable. On [POSIX][1] systems the standard exit code is
`0` for success and any number from `1` to `255` for anything else.

Exit codes can be interpreted by machine scripts to adapt in the event of
successes of failures. If exit codes are not set the exit code will be the exit
code of the last run command.

## How to get the exit code of a command

To get the exit code of a command type `echo $?` at the command prompt. In the
following example a file is printed to the terminal using the [cat][2] command.

```sh
cat file.txt
hello world
echo $?
0
```

The command was successful. The file exists and there are no errors in reading
the file or writing it to the terminal. The exit code is therefore `0`.

In the following example the file does not exist.

```sh
cat doesnotexist.txt
cat: doesnotexist.txt: No such file or directory
echo $?
1
```

The exit code is `1` as the operation was not successful.

## How to use exit codes in scripts

To use exit codes in scripts an `if` statement can be used to see if an
operation was successful.

```sh
#!/bin/bash

cat file.txt

if [ $? -eq 0 ]
then
  echo "The script ran ok"
  exit 0
else
  echo "The script failed" >&2
  exit 1
fi
```

If the command was successful the exit code will be `0` and 'The script ran ok'
will be printed to the terminal.

## How to set an exit code

To set an exit code in a script use `exit 0` where `0` is the number you want to
return. In the following example a shell script exits with a `1`. This file is
saved as `exit.sh`.

```sh
#!/bin/bash

exit 1
```

Executing this script shows that the exit code is correctly set.

```sh
bash exit.sh
echo $?
1
```

## What exit code should I use?

The Linux Documentation Project has a list of [reserved codes][3] that also
offers advice on what code to use for specific scenarios. These are the standard
error codes in Linux or UNIX.

- `1` - Catchall for general errors
- `2` - Misuse of shell builtins (according to Bash documentation)
- `126` - Command invoked cannot execute
- `127` - "command not found"
- `128` - Invalid argument to exit
- `128+n` - Fatal error signal "n"
- `130` - Script terminated by Control-C
- `255\*` - Exit status out of range

## How to suppress exit statuses

Sometimes there may be a requirement to suppress an exit status. It may be that
a command is being run within another script and that anything other than a `0`
status is undesirable.

In the following example a file is printed to the terminal using [cat][2]. This
file does not exist so will cause an exit status of `1`.

To suppress the error message any output to standard error is sent to
`/dev/null` using `2>/dev/null`.

If the cat command fails an `OR` operation can be used to provide a fallback -
`cat file.txt || exit 0`. In this case an exit code of `0` is returned even if
there is an error.

Combining both the suppression of error output and the `OR` operation the
following script returns a status code of `0` with no output even though the
file does not exist.

```sh
#!/bin/bash

cat 'doesnotexist.txt' 2>/dev/null || exit 0
```

## Further reading

- [Exit and Exit Status][4]
- [Exit Codes With Special Meanings][3]
- [Exit Status of Unix Processes][5]
- [Bash Shell Exit Status Tutorial with Practical Examples][6]

[1]: https://en.wikipedia.org/wiki/POSIX
[2]: /unix-cat/
[3]: http://www.tldp.org/LDP/abs/html/exitcodes.html
[4]: http://tldp.org/LDP/abs/html/exit-status.html
[5]: http://docstore.mik.ua/orelly/unix3/upt/ch35_12.htm
[6]: http://www.thegeekstuff.com/2010/03/bash-shell-exit-status
[7]: /images/articles/unix-exit-code.png
