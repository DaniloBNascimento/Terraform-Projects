#!/bin/bash

# Script de instalação do azure cli
# Autor: Danilo Bastos
# Docs oficiais: https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli-apt?view=azure-cli-latest
# Data: 16/09/2019
#********************************#
# Funciona em Debian e Derivados #
#********************************#

echo "Script de instalação do azure cli para debia e derivados..."
echo "iniciando instalação..."
sleep 3
# atualizando a lista de repositórios
sudo apt-get install update

# Instalando dependências
echo " "
echo "Instalando dependências necessárias..."
sleep 2
	sudo apt-get install ca-certificates \
	curl \
	apt-transport-https \
	lsb-release gnupg -y

# Download e instalação da chave de autenticação microsoft:
echo "Adicionando chave de autenticação Microsoft..."
	curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
	gpg --dearmor | \
	sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

# Variável de identificação da distribuição Linux utilizada
AZ_REPO=$(lsb_release -cs)
# Adicionando a lista de repositórios
echo "Add repo list!!!"
	echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
	sudo tee /etc/apt/sources.list.d/azure-cli.list

# Atualizando novamente a lista de repositórios
sudo apt-get update

# Instalando o azure cli
echo "***************************"
echo "> Instalação do azure cli <"
echo "***************************"
sleep 3
sudo apt-get install azure-cli -y
echo " "
echo "Instalação finalizada!"
sleep 2
# Verificando versão instalada
az --version
