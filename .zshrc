export ZSH=$HOME/.guimoz-zsh
if [[ ! -d $ZSH ]]; then
  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/custom/plugins/zsh-autosuggestions
  git clone --depth=1 https://github.com/bhilburn/powerlevel9k.git $ZSH/custom/themes/powerlevel9k
fi

plugins=(
  gitfast
  docker
  python
  extract
  zsh-autosuggestions
  zsh-syntax-highlighting
  tmux
)

# Custom conf
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭─"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰─\ue0b1 "
COMPLETION_WAITING_DOTS="true"
export EDITOR='vim'
ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_DISABLE_COMPFIX=true
ZSH_TMUX_AUTOSTART=true


[[ $TMUX != "" ]] && export TERM="screen-256color"
alias cp='cp --reflink=auto'

source $ZSH/oh-my-zsh.sh
