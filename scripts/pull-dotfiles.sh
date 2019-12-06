#!/bin/zsh

# Credit: https://github.com/durdn
# Resources:
# https://www.atlassian.com/git/tutorials/dotfiles

function dotfiles {
  /usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

echo "Pulling dotfiles"

git clone --bare git@github.com:jerry-peng/dotfiles.git ~/.dotfiles
dotfiles checkout

if [ $? != 0 ]; then
  echo "Backing up pre-existing dotfiles..."
  mkdir -p ~/.dotfiles-backup
  dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -t -I{} mv ~/{} ~/.dotfiles-backup/{}
fi

dotfiles checkout
dotfiles config status.showUntrackedFiles no

echo "Finished pulling dotfiles"
