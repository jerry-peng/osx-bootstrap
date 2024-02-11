#!/bin/zsh

echo "Pulling dotfiles"
git clone git@github.com:jerry-peng/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

echo "Running stow to symlink dotfiles"

for dir in */ ; do
    stow "$dir"
    echo "Linked $dir"
done

echo "Please manually add GitHub name and email in ~/.gitconfig"
