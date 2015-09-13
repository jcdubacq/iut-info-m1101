#! /bin/sh
if [ -n "$1" ]; then
    ACTION="${1}"
    shift
else
    ACTION=build
fi

for i in $(seq -w 0 10) ''; do
    if [ -f "archi$i.tex" ]; then
        cl2 --filter "archi${i}.tex" --action "$ACTION" "$@"
    fi
    if [ -f "sys$i.tex" ]; then
        cl2 --filter "sys${i}.tex" --action "$ACTION" "$@"
    fi
done

for i in $(ls controle*.tex); do
    cl2 --filter "$i" --action "$ACTION"
done