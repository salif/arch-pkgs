
## Add the repo

Add my PGP key with the following commands:

```
# pacman-key --keyserver "hkps://keyserver.ubuntu.com" --recv-keys 7C81F2D0E02B7A15
# pacman-key --lsign-key 7C81F2D0E02B7A15
```

Add the repo to your `/etc/pacman.conf`:

```
[salifm]
Server = https://salifm_.keybase.pub/linux/arch/$arch
```

Run the following command:

```
# pacman -Syy
```
