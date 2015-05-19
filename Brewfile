tap neovim/homebrew-neovim

update
upgrade


# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
install findutils

# Install GNU `sed`, overwriting the built-in `sed`
install gnu-sed, args: ['default-names']

# More recent versions of OS X tools
#install vim --with-lua --override-system-vi --with-python3
install homebrew/dupes/grep
install homebrew/dupes/screen

install neovim, args: ['HEAD']
install macvim, args: ['with-lua', 'with-python3', 'override-system-vim', 'HEAD']

# Apps
install archey
install tmux

# Utilities
install zsh, args: ['disable-etcdir']
install harfbuzz
install wget, args: ['enable-iri']
install pow
install ack
install imagemagick, args: ['with-webp']
install graphviz
install par
install gnuplot
install tree
install htop-osx
install nmap

# Fixes
install readline
install reattach-to-user-namespace
install tuntap
install wine
#install winetricks

# Dev
install rbenv
install pyenv
install homebrew/boneyard/pyenv-pip-rehash
install ruby-build
install gcc
install ghc cabal-install
install node
install sqlmap
install postgresql
install sqlite
install cmake
install git
install git-cola # git viewer
install hub # github cli
install gist # github gist cli
install nginx
install openssh
install openssl
install openvpn
install heroku-toolbelt
install java # JDK
install pandoc
install cheat

cleanup
