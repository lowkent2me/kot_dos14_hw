#! /bin/bash

echo Enter the string
read -a a
for i in ${a[@]}
do
  n+=$i
  done
echo $n