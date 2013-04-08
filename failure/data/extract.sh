#! /usr/bin/env bash
# ./extract-R.sh < ycsb-output-file > r-input-file
set -e
set -u

# capture input
t=$(mktemp)
cat > $t

echo timestamp meanRdLat meanWrLat
join -j1 -o 1.1,1.2,2.2 \
         <(grep READ $t   | tr -d ',' | cut -d ' ' -f 2,3 | egrep ^[0-9]+) \
         <(grep UPDATE $t | tr -d ',' | cut -d ' ' -f 2,3 | egrep ^[0-9]+)
