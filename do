#! /bin/sh
ACTION=${1:-build}

for i in $(seq -w 1 10) ''; do
    if [ -f "archi$i.tex" ]; then
        cl2 --filter "archi${i}.tex" --action "$ACTION"
    fi
    if [ -f "sys$i.tex" ]; then
        cl2 --filter "sys${i}.tex" --action "$ACTION"
    fi
done