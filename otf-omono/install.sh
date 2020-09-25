#!/usr/bin/env bash

if [ "$EUID" != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

echo "Please write the BTW sentence:"
read pp
pp=$(echo -n "$pp" | tr '[:upper:]' '[:lower:]')
if cat ./test.txt | openssl enc -d -aes-256-cbc -pbkdf2 -k "$pp" > /dev/null 2>&1; then
    echo "Decrypting..."
else
    echo "Incorrect BTW sentence! Please try again!"
    exit 1
fi
mkdir ./fonts
cd ./files
for fin in *; do
    nfin=$(echo -n "$fin" | tr '-' '/' | openssl enc -d -A -base64 | openssl enc -d -aes-256-cbc -pbkdf2 -k "$pp")
    openssl enc -d -aes-256-cbc -pbkdf2 -in ./"$fin" -out ../fonts/"$nfin" -k "$pp"
done
cd ../fonts
mkdir -p /usr/share/fonts/OTF/
cp *.otf /usr/share/fonts/OTF/
