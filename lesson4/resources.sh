#!/bin/bash
top -b -n 1 | grep Cpu | sed -re 's/\%.+\:./Использование\ ЦПУ(%):/; s/us/Пользователь/; s/sy/Система/; s/ni/Приоритет/; s/(.id).+/\ Бездействие/'
top -b -n 1 | grep Mem | sed -re '2d; s/(.free).+/МБ\ Свободно/; s/(.+:)+/Оперативная память:/; s/.total/МБ\ Всего/'
ip addr show dev ens33 | grep "inet[^6]" | sed -re 's/....inet/Адрес\ IPv4:/; s/\/.+//'
