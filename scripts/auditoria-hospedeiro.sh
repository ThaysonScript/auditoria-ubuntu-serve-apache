#!/usr/bin/env bash

IP_SERVIDOR=xxx.xxx.xxx

if which pacman; then
  sudo pacman -S nmap

elif which apt; then
  sudo apt install nmap

else
  echo "verificar repositorios existentes para instalar o nmap"

fi

nmap -sV $IP_SERVIDOR > evidencias/nmap.txt
