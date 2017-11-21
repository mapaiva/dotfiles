#!/usr/bin/env bash

GOLANG_VERSION=1.9.2
GITHUB_EMAIL=matheus.a.paiva@gmail.com

# -------------------------------------------------------------------------------------------
# Install GCC
# -------------------------------------------------------------------------------------------
sudo dnf install -y gcc gcc-c++

# -------------------------------------------------------------------------------------------
# Install Neovim
# -------------------------------------------------------------------------------------------
sudo yum -y install epel-release
curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
sudo yum -y install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # Install vim-plug

# -------------------------------------------------------------------------------------------
# Install ZSH
# -------------------------------------------------------------------------------------------
sudo yum -y install zsh
sudo dnf -y install util-linux-user
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
sudo chsh -s /usr/bin/zsh
chsh -s /usr/bin/zsh
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh

# -------------------------------------------------------------------------------------------
# Install Tilix/Terminix
# -------------------------------------------------------------------------------------------
sudo dnf copr -y enable heikoada/terminix
sudo dnf install -y terminix

# -----------------------------------------------------------------------------	--------------
# Set Gnome window's buttons to the left
# -------------------------------------------------------------------------------------------
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/DecorationLayout':<'close,minimize,maximize:'>}"

# -------------------------------------------------------------------------------------------
# Install gvm
# -------------------------------------------------------------------------------------------
sudo yum -y install bison
sudo yum -y install glibc-devel
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
gvm install go1.4 -B && gvm use go1.4 --default
gvm install go$GOLANG_VERSION && gvm use go$GOLANG_VERSION --default

# -------------------------------------------------------------------------------------------
# Create GitHub SSH key
# -------------------------------------------------------------------------------------------
ssh-keygen -t rsa -b 4096 -C "$GITHUB_EMAIL"
ssh-add ~/.ssh/id_rsa

# -------------------------------------------------------------------------------------------
# Install Docker
# -------------------------------------------------------------------------------------------
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce && sudo systemctl start docker

# -------------------------------------------------------------------------------------------
# Install Vagrant
# -------------------------------------------------------------------------------------------
sudo dnf -y install vagrant vagrant-libvirt
