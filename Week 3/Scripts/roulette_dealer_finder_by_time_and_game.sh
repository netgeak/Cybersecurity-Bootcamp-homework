#!/bin/bash
echo "please enter Date"
read date
find -type f -iname "**$date**" -exec awk '{print $1 $2,$3,$4,$5,$6,$7,$8}' {} \; > testoutput
head -n 1 testoutput > testoutput2
echo "Enter Time. Eg 02:00:00AM"
read Time
grep $Time testoutput >> testoutput2
cat testoutput2
rm testoutput
rm testoutput2

