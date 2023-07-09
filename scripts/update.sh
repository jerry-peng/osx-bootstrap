#!/bin/zsh

# update brew
echo "Updating brew..."
brew update

# upgrade brew packages
echo "Updating brew packages..."
brew upgrade

# update pip packages
echo "Updating pip packages..."
pip-review --local --interactive

# update npm packages
echo "Updating npm packages..."
npm update -g

# update rustup components
echo "Updating rustup componennts..."
rustup update
