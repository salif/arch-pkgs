#!/usr/bin/env bash

scripts="$(dirname $0)"
read -p "name: " name
fname="$scripts"/"$name".sh

[ -f "$fname" ] && echo "Error: $name already exist!" && exit 1
echo "#!/usr/bin/env bash

scripts=\"\$(dirname \$0)\"
source \"\$scripts\"/.config
" >> "$fname"
chmod +x "$fname"
