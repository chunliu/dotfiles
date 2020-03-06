# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions
	ssh-agent tmux nvm kubectl)

autoload -U compinit && compinit

ZSH_TMUX_AUTOSTART=true
# Go-lang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
# Maven
export PATH=$PATH:/opt/apache-maven-3.6.3/bin

source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
source $ZSH/oh-my-zsh.sh

# User configuration
# powerline-go
function powerline_precmd() {
	PS1="$($GOPATH/bin/powerline-go -error $? -shell zsh -modules 'venv,ssh,cwd,perms,git,hg,jobs,exit,root')"
}

function install_powerline_precmd() {
	for s in "${precmd_functions[@]}"; do
		if [ "$s" = "powerline_precmd" ]; then
			return
		fi
	done
	precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
	install_powerline_precmd
fi

# Settings for colorls
source $(dirname $(gem which colorls))/tab_complete.sh
alias lc='colorls --sd'
