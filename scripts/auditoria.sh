#!/usr/bin/env bash

mkdir -p evidencias

echo "=== CONFIGURAÇÃO SSH ===" > evidencias/ssh-config.txt; sudo grep PermitRootLogin /etc/ssh/sshd_config >> evidencias/ssh-config.txt

echo "=== PERMISSÕES DO SITE ===" > evidencias/web-permissions.txt; sudo ls -la /var/www/html >> evidencias/web-permissions.txt

echo "=== VERSÃO DO APACHE ===" > evidencias/apache-version.txt; apache2 -v >> evidencias/apache-version.txt
