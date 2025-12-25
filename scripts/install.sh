#!/bin/zsh
# Credit: https://github.com/codeinthehole Resources: https://gist.github.com/codeinthehole/26b37efa67041e1307db
# https://sourabhbajaj.com/mac-setup/Homebrew/Cask.html
# https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/

echo "Installing Rosetta 2"
softwareupdate --install-rosetta --agree-to-license

echo "Installing packages and applications"

if ! type "brew"
then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

PATH=$PATH:/opt/homebrew/bin

echo "Updating Homebrew recipes"
brew update

PACKAGES=(
    binutils
    coreutils
    diffutils
    findutils
    gawk
    gnu-indent
    gnu-sed
    gnu-tar
    gnu-which
    gnutls
    grep
    gzip
    screen
    watch
    wdiff
    wget
)
echo "Installing GNU commands which replace OSX's BSD version with Linux version"
for package in ${PACKAGES[@]}; do
    brew install $package
done

PACKAGES=(
    bash
    emacs
    gdb
    gpatch
    less
    m4
    make
    nano
)
echo "Installing GNU commands which update OSX's default version"
for package in ${PACKAGES[@]}; do
    brew install $package
done

PACKAGES=(
    ghc
    ghcup
    git
    go
    haskell-stack
    kotlin
    llvm
    luarocks
    neovim
    npm
    openjdk
    perl
    python
    pipenv # pipenv installs after python
    ruby
    rustup
    tmux
    vim
    yarn
    zsh
)
echo "Installing languages and basic programming utilities"
for package in ${PACKAGES[@]}; do
    brew install $package
done

echo "Installing rustc through rustup-init... (choose express installation)"
rustup-init

echo "Installing rustfmt"
rustup component add rustfmt

PACKAGES=(
    atool
    autoconf
    automake
    fd
    ffmpeg
    file-formula
    fzf
    graphviz
    imagemagick
    hub
    jpeg
    jq
    openssh
    reattach-to-user-namespace
    ripgrep
    rsync
    ssh-copy-id
    stow
    tree
    unzip
)
echo "Installing misc utilities"
for package in ${PACKAGES[@]}; do
    brew install $package
done

CASKS=(
    adobe-creative-cloud
    bambu-studio
    battle-net
    blender
    canon-eos-utility
    docker
    discord
    firefox
    freecad
    godot
    google-chrome
    iterm2
    malwarebytes
    obsidian
    qbittorrent
    sony-ps-remote-play
    spotify
    steam
    vagrant
    vagrant-manager
    visual-studio-code
    vlc
)

echo "Installing cask packages..."
for cask in ${CASKS[@]}; do
    brew install --cask $cask
done

QL_CASKS=(
    apparency
    betterzip
    qlmarkdown
    quicklook-csv
    quicklook-json
    suspicious-package
)
echo "Installing quicklook cask packages..."
for cask in ${QL_CASKS[@]}; do
    brew install --cask $cask
done

echo "Installing fonts..."
FONTS=(
    font-caskaydia-cove-nerd-font
    font-fira-code-nerd-font
    font-inconsolata-lgc-nerd-font
    font-fontawesome
    font-montserrat
    font-roboto
)

for font in ${FONTS[@]}; do
    brew install $font
done

echo "Cleaning up..."
brew cleanup

echo "Installing global pip packages..."
sudo python3 -m pip install --upgrade pip
PIP_PACKAGES=(
    pip-review
    pynvim
)
for package in ${PIP_PACKAGES[@]}; do
    pip3 install --break-system-packages $package
done

echo "Installing global npm packages..."
NPM_PACKAGES=(
)
for package in ${NPM_PACKAGES[@]}; do
    npm install -g $package
done

echo "Installing global cargo packages..."
CARGO_PACKAGES=(
)
for package in ${CARGO_PACKAGES}; do
    cargo install $package
done

echo "Cloning Prezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "Linking Prezto files..."
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
rm ~/.zpreztorc

echo "Cloning tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Cloning vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
