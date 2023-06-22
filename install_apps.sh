#!/bin/bash

# Lista para armazenar os nomes dos aplicativos instalados
installed_apps=()

# Função para instalar um aplicativo e adicionar à lista de instalados
install_app() {
  echo "Instalando $1..."
  sudo apt-get install -y "$1"
  installed_apps+=("$1")
}

# Atualizar o sistema
sudo apt update
sudo apt upgrade -y

# Instalar build-essential
install_app "build-essential"

# Instalar git
install_app "git"

# Instalar Visual Studio Code
# Importar a chave GPG da Microsoft
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
# Adicionar o repositório do Visual Studio Code
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
# Atualizar novamente
sudo apt update
# Instalar o Visual Studio Code
install_app "code"

# Instalar curl
install_app "curl"

# Instalar wget
install_app "wget"

# Instalar evince
install_app "evince"

# Instalar Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
install_app "sublime-text"

# Instalar LibreOffice
install_app "libreoffice"

# Instalar VLC
install_app "vlc"

# Instalar Flameshot
install_app "flameshot"

# Instalar KeePass
install_app "keepass2"

# Mostrar lista de aplicativos instalados
echo "Aplicativos instalados:"
for app in "${installed_apps[@]}"; do
  echo "$app"
done
