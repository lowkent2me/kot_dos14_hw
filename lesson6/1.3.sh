#!/bin/bash

echo Введите абсолютный путь к каталогу
read ph
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
