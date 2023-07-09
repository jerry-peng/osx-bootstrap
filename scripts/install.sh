#!/bin/zsh
# Credit: https://github.com/codeinthehole Resources: https://gist.github.com/codeinthehole/26b37efa67041e1307db
# https://sourabhbajaj.com/mac-setup/Homebrew/Cask.html
# https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/

echo "Installing packages and applications"

if ! type "brew"
then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

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
    git
    go
    haskell-stack
    kotlin
    llvm
    neovim
    openjdk
    perl
    python
    ruby
    rustup
    shfmt
    tmux
    vim
    zsh
)
echo "Installing languages and basic programming utilities"
for package in ${PACKAGES[@]}; do
    brew install $package
done

PACKAGES=(
    ccls
    codespell
    cppcheck
    docker-ls
    gopls
    haskell-language-server
    kotlin-language-server
    lua-language-server
    pyright
    rust-analyzer
    shellcheck
    shellharden
    yaml-language-server
    yamllint
)
echo "Installing languages servers"
for package in ${PACKAGES[@]}; do
    brew install $package
done

echo "Installing rustc through rustup-init... (choose express installation)"
rustup-init

PACKAGES=(
    atool
    autoconf
    automake
    ffmpeg
    file-formula
    fzf
    gettext
    gitui
    graphviz
    imagemagick
    hub
    jpeg
    jq
    npm
    openssh
    pkg-config
    reattach-to-user-namespace
    ripgrep
    rsync
    ssh-copy-id
    svn
    tree
    universal-ctags
    unzip
    yarn
)
echo "Installing misc utilities"
for package in ${PACKAGES[@]}; do
    brew install $package
done

echo "Cleaning up..."
brew cleanup

DRIVERS=(
    steelseries-exactmouse-tool
)

echo "Installing cask driver packages..."
brew tap homebrew/cask-drivers
for pkg in ${CASK[@]}; do
    brew install $pkg
done

CASKS=(
    adobe-creative-cloud
    docker
    discord
    expressvpn
    firefox
    google-chrome
    iterm2
    malwarebytes
    qbittorrent
    spotify
    steam
    vagrant
    vagrant-manager
    virtualbox
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
    qlcolorcode
    qlmarkdown
    qlstephen
    quicklook-csv
    quicklook-json
    suspicious-package
)
echo "Installing cask apps..."
for cask in ${QL_CASKS[@]}; do
    brew install --cask $cask
done

echo "Installing fonts..."
brew tap homebrew/cask-fonts
FONTS=(
    font-cascadia-code-pl
    font-caskaydia-cove-nerd-font
    font-fira-code
    font-fontawesome
    font-inconsolata
    font-input
    font-montserrat
    font-roboto
    font-source-code-pro
    font-source-sans-pro
)

for font in ${FONTS[@]}; do
    brew Install $font
done

echo "Installing Python packages..."
sudo python3 -m pip install --upgrade pip
PYTHON_PACKAGES=(
    black
    cmakelang
    debugpy
    isort
    pipenv
    pynvim
)
for package in ${PYTHON_PACKAGES[@]}; do
    pip install $package
done

echo "Installing global npm packages..."
NPM_PACKAGES=(
    eslint_d
    fixjson
    prettier
    typescript
    typescript-language-server
    vscode-langservers-extracted
)
for package in ${NPM_PACKAGES[@]}; do
    npm install -g $package
done

echo "Installing global cargo packages..."
CARGO_PACKAGES=(
    stylua
)
for package in ${CARGO_PACKAGES}; do
    cargo install $package
done

echo "Installing rustfmt"
rustup component add rustfmt

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
