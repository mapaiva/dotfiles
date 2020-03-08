#!/usr/bin/env bash

# sudo dnf install -y dnf-plugins-core

# -------------------------------------------------------------------------------------------
# Install Brave
# -------------------------------------------------------------------------------------------
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install -y brave-browser

# -------------------------------------------------------------------------------------------
# Install Neovim
# -------------------------------------------------------------------------------------------
sudo dnf install -y neovim python3-neovim
# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install custom config
curl -fLo ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/mapaiva/dotfiles/master/.config/nvim/init.vim

# -------------------------------------------------------------------------------------------
# Install ZSH
# -------------------------------------------------------------------------------------------
sudo dnf install -y zsh
# Install Oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# -------------------------------------------------------------------------------------------
# Install asdf
# -------------------------------------------------------------------------------------------
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.7
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc

# -------------------------------------------------------------------------------------------
# Install tmux
# -------------------------------------------------------------------------------------------
sudo dnf -y install tmux

# -------------------------------------------------------------------------------------------
# Install pass
# -------------------------------------------------------------------------------------------
sudo dnf -y install pass

# -------------------------------------------------------------------------------------------
# Install Docker
# -------------------------------------------------------------------------------------------
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io

# -------------------------------------------------------------------------------------------
# Install Visual Studio Code
# -------------------------------------------------------------------------------------------
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install -y code

# -------------------------------------------------------------------------------------------
# Post install
# -------------------------------------------------------------------------------------------
# Update dependencies
sudo dnf -y update
# Print manual steps
echo "Now:"
echo "
# -------------------------------------------------------------------------------------------
# Install languages
# -------------------------------------------------------------------------------------------
asdf plugin add golang
asdf install golang 1.14
asdf global golang 1.14
asdf plugin add elixir
asdf install elixir 1.10.2
asdf global elixir 1.10.2
# -------------------------------------------------------------------------------------------
# Start Docker
# -------------------------------------------------------------------------------------------
sudo systemctl start docker"
