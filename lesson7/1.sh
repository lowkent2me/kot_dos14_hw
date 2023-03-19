#! /bin/bash

#1. написать скрипт, который производит арифметические вычисления с двумя числами, в зависимости от указанного действия
#(add -- сложение, sub -- вычитание, div -- деление, mult -- умножение). при неправильном использовании скрипта вывести
#пример использования и завершить выполнение с кодом 1.
#примечание: bash поддерживает только целочисленное деление, для операций с плавающей запятой можно использовать утилиты
#типа bc и awk

#Моё решение заключается в том, чтобы сначала проверить целочисленность аргументов 2 и 3, затем обработать первый аргумент
#команды оператором выбора case и вызвать функцию, которая
#соответствует этому аргументу
#затем передать второй и третий аргумент, который ввёл пользователь в функцию


function usage() {
  case $1 in
  com) echo "Недопустимая операция $2. Необходимо использовать аргументы add sub div mult.";;
  float)
    echo "Нецелочисленный аргумент'$2' .Операции производятся только с целыми числами";;
  esac
}

function add() {
 res=$(expr $1 + $2)
 echo "Результат операции сложения $1 и $2 равен $res"
}

function sub() {
 res=$(expr $1 - $2)
 echo "Результат операции вычитания $1 из $2 равен $res"
}

function div() {
 res=$(bc<<<"scale=3;$1/$2") #команды scale и операции деления передаются на ввод в команду bc
 echo "Результат операции деления $1 на $2 равен $res"
}

function mult() {
 res=$(expr $1 * $2)
 echo "Результат операции умножения $1 на $2 равен $res"
}

main() {
  if [[ "$2" =~ ^-?[0-9]+$ ]]; then #Проверка целочисленности второго аргумента
    if [[ "$3" =~ ^-?[0-9]+$ ]]; then #Проверка целочисленности тетьего аргумента
      case $1 in
        add) add $2 $3;;
        sub) sub $2 $3;;
        div) div $2 $3;;
        mult) mult $2 $3;;
        *) usage com $1;;
      esac
     else
     usage float $3
    fi
  else
    usage float $2
 fi
}

main "$@"

