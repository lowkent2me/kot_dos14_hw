#! /bin/bash

#Написать функцию проверки на корректность e-mail:

function mail() {
  clear
  echo Введите e-mail
  read m
    m=($(echo $m | grep -E '^[a-zA-Z0-9_.-]{3,}@[a-zA-Z0-9_.-]{3,}\.\w{2,3}$' | wc -l))
    if [ $m == 1 ]; then
        echo Валидация e-mail пройдена
        else echo В введённом e-mail есть ошибка
    fi
}