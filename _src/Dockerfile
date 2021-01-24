FROM archlinux:latest

RUN pacman -Syu --noconfirm --needed base base-devel git tree go
RUN useradd -d /home/makepkg makepkg && \
    mkdir -p /home/makepkg/{.config/pacman,.gnupg,build/{srcdest,srcpkgdest,logdest,build,out}} && \
    echo 'keyserver-options auto-key-retrieve' > /home/makepkg/.gnupg/gpg.conf && \
    echo 'root  ALL=(ALL) ALL' >> /etc/sudoers && \
    echo 'makepkg ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    chown -R makepkg:users /home/makepkg

VOLUME /_pkg /_build
COPY arch-pkgs-build /usr/local/bin/
