#   _____       _                    _               _
#  / ____|     (_)                  ( )             | |
# | |  __ _   _ _ _ __ ___   ___ ___|/ ___   _______| |__
# | | |_ | | | | | '_ ` _ \ / _ \_  / / __| |_  / __| '_ \
# | |__| | |_| | | | | | | | (_) / /  \__ \  / /\__ \ | | |
# \_____|\__,_|_|_| |_| |_|\___/___| |___/ /___|___/_| |_|
#
# Credits : https://github.com/robbyrussell/oh-my-zsh/blob/master/tools/install.sh for the install of zsh
#
#! /bin/sh


SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
BACKUPDIR=$SCRIPTPATH/backups/"$(date +'%Y-%m-%d_%T')"
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

set -e

# Step ! : install of oh-my-zsh

if ! command -v zsh >/dev/null 2>&1; then
  printf "${YELLOW}Zsh is not installed!${NORMAL} Please install zsh first!\n"
  exit
fi

if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

if [ -d "$ZSH" ]; then
  printf "${YELLOW}You already have Oh My Zsh installed.${NORMAL}\n"
  printf "You'll need to remove $ZSH if you want to re-install.\n"
  exit
fi

umask g-w,o-w

printf "${BLUE}Cloning Oh My Zsh...${NORMAL}\n"
command -v git >/dev/null 2>&1 || {
  echo "Error: git is not installed"
  exit 1
}

env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$ZSH" || {
  printf "Error: git clone of oh-my-zsh repo failed\n"
  exit 1
}

# If this user's login shell is not already "zsh", attempt to switch.
  TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
  if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    # If this platform provides a "chsh" command (not Cygwin), do it, man!
    if hash chsh >/dev/null 2>&1; then
      printf "${BLUE}Time to change your default shell to zsh!${NORMAL}\n"
      chsh -s $(grep /zsh$ /etc/shells | tail -1)
    # Else, suggest the user do so manually.
    else
      printf "I can't change your shell automatically because this system does not have chsh.\n"
      printf "${BLUE}Please manually change your default shell to zsh!${NORMAL}\n"
    fi
fi

# Step 2 : dependencies install

git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k

git clone https://github.com/zsh-users/zsh-autosuggestions  $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Step 3 : backup of previous dotfiles

mkdir -p $BACKUPDIR

cp $HOME/.zshrc $BACKUPDIR

# Step 4 : copy of our zshrc

cp $SCRIPTPATH/.zshrc $HOME/.zshrc
