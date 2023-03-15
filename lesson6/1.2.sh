#!/bin/bash

echo 'Введите массив рандомных значений как строковых так и числовых (элементы массива задаются через пробел)'
read -a arr2
declare -a arr1 arr2 arr3
arr1=(foo bar blah test 123 smad dasd asda ssad fizz buzz)
for i in ${arr2[@]}
do
  for n in ${arr1[@]}
  do
    if [[ "$i" == "$n" ]];
	then
	arr3+=("$i")
	fi
  done
done

echo ${arr3[@]}