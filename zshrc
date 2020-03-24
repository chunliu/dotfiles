# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export LS_COLORS="$(vivid generate solarized-dark)"
alias ls='lsd'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

neofetch
