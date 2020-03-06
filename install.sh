#!/bin/bash

GREEN='\e[32m'
NC='\e[0m'

# Update the package list and install zsh, tmux and vim
echo -e "${GREEN}Install necessary packages...${NC}"
sudo apt update
sudo apt install zsh tmux vim build-essential ruby ruby-dev ruby-colorize -y

# Create symbolic link for .tmux.conf
if [ -f ~/.tmux.conf ]; then
	echo -e "${GREEN}Remove existing .tmux.conf...${NC}"
	echo ""
	rm ~/.tmux.conf
fi 
echo -e "${GREEN}Create symbolic link for .tmux.conf${NC}"
echo ""
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

# Install oh-my-zsh
if [ -d ~/.oh-my-zsh/ ] ; then
	echo -e "${GREEN}oh-my-zsh has already been installed...${NC}"
	echo ""
else
	echo -e "${GREEN}oh-my-zsh not found, install it...${NC}"
	echo ""
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"  "" --unattended
fi

# Install oh-my-zsh plugin
echo -e "${GREEN}install oh-my-zsh plugins...${NC}"
echo ""
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# Install go and powerline-go
if [ -d /usr/local/go/ ]; then
	echo -e "${GREEN}go is already installed...${NC}"
	echo ""
else
	echo -e "${GREEN}go is not found, now install it...${NC}"
	echo ""
	wget -O go1.14.linux-amd64.tar.gz https://dl.google.com/go/go1.14.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.14.linux-amd64.tar.gz
	export PATH=$PATH:/usr/local/go/bin
	export GOPATH=$HOME/go
fi

echo -e "${GREEN}Install powerline-go...${NC}"
echo ""
go get -u github.com/justjanne/powerline-go

# Install and configure Colorls
echo -e "${GREEN}Install colorls...${NC}"
echo ""
sudo gem install colorls

# Configure vim
echo -e "${GREEN}Configure vim...${NC}"
echo ""
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ -f ~/.vimrc ]; then
	echo -e "${GREEN}Remove existing .vimrc...${NC}"
	echo ""
	rm ~/.vimrc
fi
echo -e "${GREEN}Create symbolic link for .vimrc${NC}"
echo ""
ln -s ~/.dotfiles/vimrc ~/.vimrc

# Create symbolic link for .zshrc
if [ -f ~/.zshrc ]; then
	echo -e "${GREEN}Remove existing .zshrc...${NC}"
	echo ""
	rm ~/.zshrc
fi
echo -e "${GREEN}Create symbolic link for .zshrc...${NC}"
echo ""
ln -s ~/.dotfiles/zshrc ~/.zshrc
# source ~/.zshrc
# Change the shell to zsh
echo -e "${GREEN}Change shell to zsh...${NC}"
sudo chsh $USER -s $(which zsh)

echo -e "${GREEN}All configurations are done!!! Good to go. Enjoy it!${NC}"
