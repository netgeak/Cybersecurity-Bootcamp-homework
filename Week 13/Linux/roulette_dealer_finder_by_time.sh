#!/bin/bash
echo "please enter Date"
read date
find -type f -iname "**$date**" -exec awk '{print $1 $2,$5,$6}' {} \; > testoutput

echo "Enter Time. Eg 02:00:00AM"
read Time
grep $Time testoutput
rm testoutput
#fi
