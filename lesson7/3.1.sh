#!/bin/bash
#1. написать bash-скрипт с использованием функции:
#1.1. на вход которого поступает строка, на выходе нужно получить эту строку без пробелов.
#пример:
#this is test sample -> thisistestsample

function usage() {
  case $1 in
  null) echo "В качестве аргументов не передано ни одного слова";;
  esac
}

function space() {
    declare -a work
    work+=($@)
    n=()
     for i in ${work[@]}
     do
       n+=$i
       done
     echo $n
}

function main() {
    declare -a myArray+=($@)
    if [ ${#myArray[@]} == 0 ]; then
            usage null
            else  space ${myArray[@]}
        fi
}

main $@