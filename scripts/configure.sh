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

# Create terminfo entry for `tmux-256color` which supports italic, needed before MacOS Sonoma
# Credit: https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/
echo "Adding tmux-256color terminfo entry"
/usr/local/opt/ncurses/bin/infocmp -x tmux-256color > ~/tmux-256color.src
sed 's/pairs#0x10000/pairs#32767/' ~/tmux-256color.src
sed 's/pairs#65536/pairs#32767/' ~/tmux-256color.src
/usr/bin/tic -x -o $HOME/.local/share/terminfo ~/tmux-256color.src
rm -f ~/tmux-256color.src

echo "Sourcing ~/.zshrc"
source ~/.zshrc

echo "Installing tmux plugins..."
tmux start-server
tmux new-session -d
tmux source ~/.tmux.conf
sleep 1
~/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server

echo "Installing vim plugins..."
vim +PlugInstall +qall
