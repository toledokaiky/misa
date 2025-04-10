#!/bin/bash

# Atualiza o sistema
echo "Atualizando pacotes do sistema..."
sudo apt update && sudo apt upgrade -y

# Instala o gobuster
echo "Instalando o Gobuster..."
sudo apt install gobuster -y

echo "Atualização e instalação concluídas!"
