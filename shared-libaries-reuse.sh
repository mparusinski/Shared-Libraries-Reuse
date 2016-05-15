#!/bin/sh

printf "Library\t\t\t\tNumber of dependent packages\n"

TOTAL_USED=0
NUM=0

for i in `dpkg  --get-selections | grep ^lib | cut -f 1`
do
    USED_NUM=$(apt-cache rdepends $i | wc -l)
    USED_NUM=$(($USED_NUM - 2))
    printf "%30s\t\t\t\t%d\n" $i $USED_NUM
    TOTAL_USED=$(($TOTAL_USED + $USED_NUM))
    NUM=$(($NUM + 1))
done

AVERAGE=$(($TOTAL_USED / $NUM))
printf "\n%30s\t\t\t\t%d\n" "Average" $AVERAGE
