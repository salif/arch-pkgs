# Personal Arch Linux Repository

## Add the repo

Add my PGP key with the following commands:

```console
# pacman-key --keyserver "hkps://keyserver.ubuntu.com" --recv-keys 7C81F2D0E02B7A15
# pacman-key --lsign-key 7C81F2D0E02B7A15
```

Add the repo to your `/etc/pacman.conf`:

```
[salifm]
Server = https://downloads.sourceforge.net/project/arch-pkgs/$arch
```

Run the following command:

```console
# pacman -Syy
```

## List of packages

[sourceforge.net/projects/arch-pkgs/files/x86\_64/](https://sourceforge.net/projects/arch-pkgs/files/x86_64/)
