#!/bin/zsh

echo "Updating brew..."
brew update

echo "Updating brew packages..."
brew upgrade

echo "Cleaning up brew..."
brew autoremove && brew cleanup

echo "Updating pip packages..."
pip-review --local --interactive

echo "Updating npm packages..."
npm update -g

echo "Updating rustup componennts..."
rustup update

echo "Updating prezto..."
cd ~/.zprezto
git pull
git submodule sync --recursive
git submodule update --init --recursive
cd -

echo "======== Manual Steps ========"
echo "In tmux, run 'prefix + U' to update plugins"
echo "In Neovim,"
echo "Run :TSUpdate all, to update treesitter parsers"
echo "Run :Lazy to open Lazy.nvim UI and update plugins"
echo "Run :Mason to open Mason.nvim UI and update language servers/linters"
