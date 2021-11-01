#!/bin/zsh

dir=$(pwd)

cd $HOME
zsh "$dir/install.sh" 
zsh "$dir/pull-dotfiles.sh" 
zsh "$dir/configure.sh" 
zsh "$dir/codepull.sh" 
