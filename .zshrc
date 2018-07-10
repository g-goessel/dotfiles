# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
COMPLETION_WAITING_DOTS="true"
export EDITOR='vim'
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_AUTOSTART=true
ZSH_DISABLE_COMPFIX=true
plugins=(
  git
  django
  docker
  npm
  pip
  python
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
