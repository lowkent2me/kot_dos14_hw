#! /bin/bash

#Написать функцию проверки на корректность url:

function url() {
  clear
    echo Введите url
    read u
    u=($(echo $u | grep -E '^(https?:\/\/)?([a-zA-Z-]{2,}\.)([a-zA-Z-]{2,}\.)?([a-zA-Z-]{2,}\.)?[a-zA-Z-]{2,3}(\/.*)?$' | wc -l))
    if [ $u == 1 ]; then
        echo Валидация url пройдена
        else echo В введённом url есть ошибка
    fi
}