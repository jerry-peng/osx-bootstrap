#!/bin/zsh

echo "Setting up ssh keys"

read -p "Enter email for SSH key: " email
ssh-keygen -t ed25519 -C "$email"
eval `ssh-agent -s`

if [ -d "~/.ssh" ]
then 
  echo "Creating ~/.ssh directory"
  mkdir -p ~/.ssh
fi

echo "Copying ssh config"

cp ../config/ssh_config ~/.ssh/config
/usr/bin/ssh-add -K ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
