#!/bin/bash

# Update the package list and install zsh, tmux and vim
echo "Install necessary packages"
sudo apt update
sudo apt install zsh tmux vim build-essentia ruby ruby-dev ruby-colorize -y

# Create symbolic link for .tmux.conf
echo "Update .tmux.conf"
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

# Install oh-my-zsh
if [ -d ~/.oh-my-zsh/ ] ; then
	echo ''
	echo "oh-my-zsh has already been installed..."
else
	echo "oh-my-zsh not found, now install oh-my-zsh..."
	echo ''
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install oh-my-zsh plugin
echo "install oh-my-zsh plugins..."
echo ''
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# Install go and powerline-go
if [ -d /usr/local/go/ ]; then
	echo ''
	echo "go is already installed..."
else
	echo "go is not found, now install it..."
	echo ''
	wget -O go1.14.linux-amd64.tar.gz https://dl.google.com/go/go1.14.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.14.linux-amd64.tar.gz
	export PATH=$PATH:/usr/local/go/bin
	export GOPATH=$HOME/go
fi

echo "Install powerline-go..."
go get -u github.com/justjanne/powerline-go

# Install and configure Colorls
echo "Install colorls..."
sudo gem install colorls

echo "Update .zshrc..."

