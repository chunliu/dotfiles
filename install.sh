#!/bin/bash

GREEN='\e[32m'
NC='\e[0m'

# Update the package list and install zsh, tmux and vim
echo "${GREEN}Install necessary packages...${NC}"
sudo apt update
sudo apt install zsh tmux vim neofetch -y

# Create symbolic link for .tmux.conf
if [ -f ~/.tmux.conf ]; then
	echo "${GREEN}Remove existing .tmux.conf...${NC}"
	echo ""
	rm ~/.tmux.conf
fi 
echo "${GREEN}Create symbolic link for .tmux.conf${NC}"
echo ""
ln -s $HOME/.dotfiles/tmux.conf ~/.tmux.conf

# Install oh-my-zsh
if [ -d ~/.oh-my-zsh/ ] ; then
	echo "${GREEN}oh-my-zsh has already been installed...${NC}"
	echo ""
else
	echo "${GREEN}oh-my-zsh not found, install it...${NC}"
	echo ""
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"  "" --unattended
fi

# Install oh-my-zsh plugin
echo "${GREEN}install oh-my-zsh plugins...${NC}"
echo ""
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
echo "${GREEN}Install powerlevel10k...${NC}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Install and configure lsd
echo "${GREEN}Install vivid and lsd...${NC}"
echo ""
wget https://github.com/sharkdp/vivid/releases/download/v0.6.0/vivid_0.6.0_amd64.deb
sudo dpkg -i vivid_0.6.0_amd64.deb

wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb
sudo dpkg -i lsd_0.20.1_amd64.deb

# Configure vim
echo "${GREEN}Configure vim...${NC}"
echo ""
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ -f ~/.vimrc ]; then
	echo "${GREEN}Remove existing .vimrc...${NC}"
	echo ""
	rm ~/.vimrc
fi
echo "${GREEN}Create symbolic link for .vimrc${NC}"
echo ""
ln -s $HOME/.dotfiles/vimrc ~/.vimrc

# Create symbolic link for .zshrc
if [ -f ~/.zshrc ]; then
	echo "${GREEN}Remove existing .zshrc...${NC}"
	echo ""
	rm ~/.zshrc
fi

if [ -f ~/.p10k.zsh ]; then
	echo "${GREEN}Remove existing .p10k.zsh...${NC}"
	echo ""
	rm ~/.p10k.zsh
fi

echo "${GREEN}Create symbolic link for .p10k.zsh .zshrc...${NC}"
echo ""
ln -s $HOME/.dotfiles/p10k.zsh ~/.p10k.zsh
ln -s $HOME/.dotfiles/zshrc ~/.zshrc
# Change the shell to zsh
echo "${GREEN}Change shell to zsh...${NC}"
echo ""
sudo chsh $USER -s $(which zsh)

echo "${GREEN}All configurations are done!!! Good to go.${NC}"
echo "${GREEN}Logout and login again to see the difference.${NC}"
