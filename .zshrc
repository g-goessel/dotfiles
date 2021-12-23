export ZSH=$HOME/.guimoz-zsh
if [[ ! -d $ZSH ]]; then
  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/custom/plugins/zsh-autosuggestions
  git clone --depth=1 https://github.com/romkatv/powerlevel10k $ZSH/custom/themes/powerlevel10k
fi

plugins=(
  gitfast
  docker
  svn
  python
  extract
  zsh-autosuggestions
  zsh-syntax-highlighting
  tmux
)

# Custom conf
POWERLEVEL9K_MODE='awesome-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭─"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰─\ue0b1 "
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
COMPLETION_WAITING_DOTS="true"
export EDITOR='nvim'
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_DISABLE_COMPFIX=true
DISABLE_MAGIC_FUNCTIONS=true
#ZSH_TMUX_AUTOSTART=true
#ZSH_TMUX_AUTOQUIT=false

[[ $TMUX != "" ]] && export TERM="screen-256color"
alias cp='cp --reflink=auto'
alias cp='cp'
alias vim='nvim'
alias ff='/Applications/Firefox.app/Contents/MacOS/firefox-bin -P --no-remote'
source $ZSH/oh-my-zsh.sh

export PATH=$PATH:${HOME}/.cargo/bin


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
