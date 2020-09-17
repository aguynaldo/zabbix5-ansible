#!/bin/bash

# Configurando o ssh por senha
echo "[TASK 1] Configurando o SSH para aceitar conexão por senha."; sleep 3
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd.service


# Instalando o Python 
echo "[TASK 2] Instalando o Python 3"
dnf makecache
dnf install python3 -y

