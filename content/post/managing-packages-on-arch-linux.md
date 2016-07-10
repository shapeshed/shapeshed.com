{
  "title": "Managing packages on Arch Linux",
  "date": "2014-01-10T15:18:05+00:00",
  "description": "My simple workflow for managing packages on Arch Linux.",
  "tags": [
    "Linux"
  ]
}

## Pacman and AUR

Arch's package manager Pacman is great. It makes it really easy to update and manage packages that you have installed. Updating is as simple as 

    sudo pacman -Syu

Before too long you'll find that you want to install something from the Arch User Repository. This allows community members to create and share PKGBUILD files. It is also easy to [create your own][1] if whatever you want isn't already in the AUR. 

To work with packages from the AUR there are a few options to choose from. Many go for [yaourt][2] but personally I prefer the more lightweight [cower][3].

## Managing updates

I'm interested in seeing what has been updated, particular for packages from AUR. I run [dwm][4] and this allows you to set the contents of a status bar with xsetroot. You can get the number of updates available for pacman and aur installed packages with the following.

    pacman -Qqu | wc -l
    cower -u | wc -l

So you can use this in an .xinitrc file to set the status and check these values every minute

    while true; do
      PMUPDATES="$(pacman -Qqu | wc -l)"
      AURUPDATES="$(cower -u | wc -l)"
      xsetroot -name "$PMUPDATES $AURUPDATES $(date +"%F %R")" 
      sleep 60
    done &
    exec dwm

Now whenever you want to you can glance up to the top right of the screen and see if there are updates available. 

![cower icons][5]

Another alternative is to use `checkupdates`, one of the many useful helper scripts bundled with pacman. For details, run 
    
    checkupdates -h
    
To see the full list of the helper scripts, run

    pacman -Ql pacman | awk -F/ '/bin/ {print $4}'

## Cower

I really like cower. It does just enough. I like to review what has changed and check PKGBUILD files before I install them. I took most of [Jason Ryan's][6] [cowerd][7] script and have it in my PATH like this.

    #!/usr/bin/env sh

    cd $HOME/src && cower -d "$1"
    builddir="$_"
    cd "$builddir" && ${EDITOR:-vi} PKGBUILD
    makepkg -si && cd - &>/dev/null
    rm -Rf "$builddir"

To check what is available I run

    cower -u

Then update with 

    cowerd [package name]

## Simple is good

Since I [moved over from Arch Linux][8] I've loved the simplicy that Arch, dwm and other suckless tools have offered me. Pacman and cower make package management a breeze.

[1]: https://wiki.archlinux.org/index.php/Creating_Packages
[2]: https://wiki.archlinux.org/index.php/Yaourt
[3]: https://aur.archlinux.org/packages/cower/
[4]: http://dwm.suckless.org/
[5]: https://shapeshed.com/images/articles/pacman-cower.png
[6]: http://jasonwryan.com/
[7]: https://bitbucket.org/jasonwryan/shiv/src/67d4a496a8fd239805b369886b669fe4a34f5eb7/Scripts/cowerd
[8]: https://shapeshed.com/from-osx-to-arch-linux/

