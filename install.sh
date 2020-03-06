#!/bin/bash

# Update the package list and install zsh, tmux and vim
echo "Install necessary packages"
sudo apt update
sudo apt install zsh tmux vim build-essential ruby ruby-dev ruby-colorize -y

# Create symbolic link for .tmux.conf
if [ -f ~/.tmux.conf ]; then
	echo "Remove existing .tmux.conf..."
	echo ""
	rm ~/.tmux.conf
fi 
echo "Create symbolic link for .tmux.conf"
echo ""
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

# Install oh-my-zsh
if [ -d ~/.oh-my-zsh/ ] ; then
	echo "oh-my-zsh has already been installed..."
	echo ""
else
	echo "oh-my-zsh not found, now install oh-my-zsh..."
	echo ""
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install oh-my-zsh plugin
echo "install oh-my-zsh plugins..."
echo ""
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# Install go and powerline-go
if [ -d /usr/local/go/ ]; then
	echo "go is already installed..."
	echo ""
else
	echo "go is not found, now install it..."
	echo ""
	wget -O go1.14.linux-amd64.tar.gz https://dl.google.com/go/go1.14.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.14.linux-amd64.tar.gz
	export PATH=$PATH:/usr/local/go/bin
	export GOPATH=$HOME/go
fi

echo "Install powerline-go..."
echo ""
go get -u github.com/justjanne/powerline-go

# Install and configure Colorls
echo "Install colorls..."
echo ""
sudo gem install colorls

# Configure vim
echo "Configure vim..."
echo ""
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ -f ~/.vimrc ]; then
	echo "Remove existing .vimrc..."
	echo ""
	rm ~/.vimrc
fi
echo "Create symbolic link for .vimrc"
echo ""
ln -s ~/.dotfiles/vimrc ~/.vimrc



if [ -f ~/.zshrc ]; then
	echo "Remove existing .zshrc..."
	echo ""
	rm ~/.zshrc
fi
echo "Create symbolic link for .zshrc..."
echo ""
ln -s ~/.dotfiles/zshrc ~/.zshrc
source ~/.zshrc

echo "All configurations are done!!! Enjoy it!"
