#!/bin/bash
#1. написать bash-скрипт с использованием функции:
#1.2. который сравнивает два массива на наличие общих элементов и выводит их.
#пример:
#arr1 = ["foo", "bar", "blah", "test", "123", "smad", "dasd", "foo"]
#arr2 = ["bar", "blah", "test", "1223", "ss", "foo", "dfd"]
#returns ["foo", "bar", "blah", "test"]

function usage() {
  case $1 in
  null) echo "В качестве аргументов не передано ни одного слова";;
  esac
}

function def() {
    declare -a arr1 arr2 arr3
    arr2=($@)
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
    echo ${arr1[@]}
    echo ${arr2[@]}
    echo ${arr3[@]}
}

function main() {
    declare -a myArray+=($@)
    if [ ${#myArray[@]} == 0 ]; then
            usage null
            else  def ${myArray[@]}
        fi
}

main $@