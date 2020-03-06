# Path to your oh-my-zsh installation.
export ZSH="/home/chunliu/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting 
	ssh-agent tmux nvm)

ZSH_TMUX_AUTOSTART=true
# Go-lang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go

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

