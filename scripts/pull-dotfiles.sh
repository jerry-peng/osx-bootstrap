#!/bin/zsh

PATH=$PATH:/opt/homebrew/bin

echo "Pulling dotfiles"
git clone git@github.com:jerry-peng/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

echo "Running stow to symlink dotfiles"

rm -f ~/.zshrc
for dir in */ ; do
    stow "$dir"
    echo "Linked $dir"
done

echo "Sourcing .zshrc"
source ~/.zshrc

echo "Updating git index to stop tracking changes to gitconfig"
git update-index --assume-unchanged git/.gitconfig

echo "Please manually complete the following:"
echo "- Add GitHub name and email in ~/.gitconfig"
echo "- Source ~/.zshrc"
