#!/bin/zsh

echo "Creating Files folder"
mkdir -p ~/Files/Codes

echo "Cloning notes"
git clone git@github.com:jerry-peng/notes.git ~/Files/Codes/notes

echo "Cloning private notes"
git clone git@github.com:jerry-peng/private-notes.git ~/Files/Codes/private-notes

echo "Cloning osx-boostrap"
git clone git@github.com:jerry-peng/osx-bootstrap.git ~/Files/Codes/osx-bootstrap
