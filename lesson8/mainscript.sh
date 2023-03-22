#! /bin/bash

#2. Оформить каждую функцию как подключаемый модуль и создать скрипт, в который они будут подключаться. Организовать интерактивное меню для выбора функции

source ./mail.sh
source ./url.sh
source ./phone.sh
source ./pass.sh

#Создаем меню
function menu {
    clear
    echo
    echo -e "\t\t\tМеню скрипта\n"
    echo -e "\t1. Проверка e-mail"
    echo -e "\t2. Проверка url"
    echo -e "\t3. Проверка мобильного номера телефона"
    echo -e "\t4. Проверка пароля"
    echo -e "\t0. Выход"
    echo -en "\t\tВведите номер раздела: "
    read -n 1 option
}

function main() {
    #Используем цикл While и команду Case для создания меню.
    while [ $? -ne 1 ]
    do
            menu
            case $option in
    0) break ;;
    1) mail ;;
    2) url ;;
    3) number ;;
    4) password ;;
    *) clear
    echo "Нужно выбрать раздел";;
    esac
    echo -en "\n\n\t\t\tНажмите любую клавишу для продолжения"
    read -n 1 line
    done
    clear
}

main