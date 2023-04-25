#!/bin/bash
#1. написать bash-скрипт с использованием функции:
#1.3. который выводит листинг текущей директории по расширению файла.
#для решения могут быть полезны:
#- специальная переменная IFS
#- вывод echo с интерпретацией "\" — echo -e

function usage() {
  case $1 in
  null) echo "В качестве аргументов не передано ни одного слова";;
  err) echo "Нет такого файла или каталога"
    echo $2;;
  esac
}

function list() {
    ph=()
    ph=$1
    declare -a l1 ex
    l1=($(ls $ph))
    ex=($(ls $ph | sed -re 's/.+\.//' | uniq))
    for e in ${ex[@]}
    do
      echo Файлы с расширением $e:
      for n in ${l1[@]}
      do
        if [[ $(echo $n | sed -re 's/.+\.//') == "$e" ]]; then
            echo $n
        fi
      done
    done
}

function main() {
    declare -a myArray+=($@)
    ph=$1
    if [ ${#myArray[@]} == 0 ]; then
            usage null
            else  list $ph
        fi
}

main $@