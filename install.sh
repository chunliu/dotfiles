#!/bin/bash

# Update the package list
sudo apt update

# Install and configure zsh
which zsh > /dev/null 2>&1
if [ $? -eq 0 ] ; then
	echo ''
	echo "zsh already installed..."
else
	echo "zsh not found, now installing zsh..."
	echo ''
	sudo apt install zsh -y
fi

# Install oh-my-zsh
if [ -d ~/.oh-my-zsh/ ] ; then
	echo ''
	echo "oh-my-zsh is already installed..."
else
	echo "oh-my-zsh not found, now installing oh-my-zsh..."
	echo ''
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install oh-my-zsh plugin
echo "install oh-my-zsh plugins..."
echo ''
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
