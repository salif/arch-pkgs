#!/usr/bin/env bash

if [ $# -lt 1 ]
then
    echo "Usage: create-script.sh [name]"
    exit
fi

scripts="$(dirname $0)"
name="$1"
fname="$scripts"/"$name".sh

[ -f "$fname" ] && echo "Error: $name already exist!" && exit 1
echo "#!/usr/bin/env bash

if [ \$# -lt 1 ]
then
    echo \"Usage: "$name".sh [arg]\"
    exit
fi" >> "$fname"
chmod +x "$fname"
