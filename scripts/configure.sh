#!/bin/zsh

# Credit: https://github.com/codeinthehole
# Resources:
# https://gist.github.com/codeinthehole/26b37efa67041e1307db

echo "Configuring..."

# Disabling write permissions and updating owner of zshr directories, otherwise
# zsh considers this directory insecure and prevents compinit.
echo "Disable write permission, and update owner for zsh directory"
sudo chmod -R 755 /usr/local/share/zsh
sudo chown -R root:staff /usr/local/share/zsh
#sudo chown -R $(whoami) /usr/local/share/zsh /usr/local/share/zsh/site-functions
#chmod u+w /usr/local/share/zsh /usr/local/share/zsh/site-functions

echo "Installing tmux plugins..."
tmux start-server
tmux new-session -d
tmux source ~/.tmux.conf
sleep 1
~/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server

echo "Installing vim plugins..."
vim +PlugInstall +qall

source ~/.zshrc
