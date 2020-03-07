# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions
	ssh-agent tmux nvm kubectl)

autoload -U compinit && compinit

ZSH_TMUX_AUTOSTART=true
# Go-lang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
# Maven
export PATH=$PATH:/opt/apache-maven-3.6.3/bin

if [ -f $HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh ]; then
	source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
fi

source $ZSH/oh-my-zsh.sh

# User configuration
# Settings for colorls
source $(dirname $(gem which colorls))/tab_complete.sh
alias lc='colorls --sd'
