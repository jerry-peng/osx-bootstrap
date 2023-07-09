#!/bin/zsh

# Credit: https://github.com/codeinthehole
# Resources:
# https://gist.github.com/codeinthehole/26b37efa67041e1307db

echo "Configuring..."

# Disabling write permissions and updating owner of zshr directories, otherwise
# zsh considers this directory insecure and prevents compinit.
echo "Disable write permission, and update owner for zsh directory"
sudo chmod -R 755 /usr/local/share/zsh
sudo chown -R `whoami`:staff /usr/local/share/zsh /usr/local/share/zsh/site-functions
chmod u+w /usr/local/share/zsh /usr/local/share/zsh/site-functions

echo "Installing tmux plugins..."
tmux start-server
tmux new-session -d
tmux source ~/.tmux.conf
sleep 1
~/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server
pwd
[ -d "/Users/`whoami`/.tmux/plugins/tmux-continuum/" ] && \
    cp ../config/osx_iterm_start_tmux.sh ~/.tmux/plugins/tmux-continuum/scripts/handle_tmux_automatic_start/osx_iterm_start_tmux.sh || \
    echo "tmux-continuum not installed, needs debugging"

echo "Installing vim plugins..."
vim +PlugInstall +qall

source ~/.zshrc
