ZPLUG_HOME=${HOME}/.zplug
# Check if zplug is installed
#if [[ ! -d ~/.zplug ]]; then
#  git clone https://github.com/zplug/zplug ~/.zplug
#fi

# Essential
source ~/.zplug/init.zsh

# zplug section
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/django", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "lib/completion", from:oh-my-zsh
zplug "lib/grep", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "MichaelAquilina/zsh-you-should-use"
zplug "plugins/extract", from:oh-my-zsh # func, compdef

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# Load theme file
zplug 'bhilburn/powerlevel9k', as:theme

# Install plugins if there are plugins that have not been installed
#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi

# Custom conf
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭─"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰─\ue0b1 "
COMPLETION_WAITING_DOTS="true"
export EDITOR='vim'
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_DISABLE_COMPFIX=true

export LC_ALL="fr_FR.UTF-8"


[[ $TMUX != "" ]] && export TERM="screen-256color"
alias cp='cp --reflink=auto'

# Then, source plugins and add commands to $PATH
zplug load
