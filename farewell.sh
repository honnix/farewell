#!/bin/bash

chr() {
  printf \\$(printf '%03o' $1)
}

ord() {
  printf '%d' "'$1"
}

while read line
do
    content=$content$line
done < $1

formalized=`echo $content | sed 's/[\n\r\t ]//g'`

OIFS=$IFS
IFS=','

KEY="i hope in the next ten years there would be no other farewell letter brilliant than this one"
LENGTH=${#KEY}

i=0
for x in $formalized
do
    index=$(($i % $LENGTH))
    code=`ord ${KEY:$index:1}`

    chr $(($x ^ $code))

    i=$(($i + 1))
done

IFS=$OIFS
