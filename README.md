# Personal Arch Linux Repository

## Add the repo

Add my PGP key with the following commands:

```console
# pacman-key --keyserver "hkps://keyserver.ubuntu.com" --recv-keys 7C81F2D0E02B7A15
# pacman-key --lsign-key 7C81F2D0E02B7A15
```

Add the repo to your `/etc/pacman.conf`:

```toml
[salifm]
Server = https://salifm_.keybase.pub/linux/arch/$arch
```

Run the following command:

```console
# pacman -Syy
```

## List of packages

[keybase.pub/salifm\_/linux/arch/x86\_64](https://keybase.pub/salifm_/linux/arch/x86_64)
