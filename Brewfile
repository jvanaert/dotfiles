update
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
install findutils

# Install GNU `sed`, overwriting the built-in `sed`
install gnu-sed --default-names

# More recent versions of OS X tools
#install vim --with-lua --override-system-vi --with-python3
install homebrew/dupes/grep
install homebrew/dupes/screen

# Install Neovim
tap neovim/homebrew-neovim
install --HEAD neovim

install macvim --with-lua --with-python3 --override-system-vim --HEAD

# Apps
install archey
install tmux

# Utilities
install zsh --disable-etcdir
install harfbuzz
install wget --enable-iri
install pow
install ack
install imagemagick --with-webp
install graphviz
install par
install gnuplot
install tree
install htop-osx
install nmap
install hub

# Fixes
install readline
install reattach-to-user-namespace
install tuntap
install wine
#install winetricks


# Dev
install python
install python3
install rbenv
install pyenv
install ruby-build
install gcc
install ghc cabal-install
install node
install sqlmap
install postgresql
install sqlite
install cmake
install git
install git-cola
install nginx
install openssh
install openssl
install openvpn
install heroku-toolbelt

cleanup
