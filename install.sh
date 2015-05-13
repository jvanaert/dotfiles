cd ~
# Remove .git directory copied over from bootstrap.sh
rm -rf .git/ 
rm .gitmodules
rm .gitignore

# OS-specific installation
if [ "$(uname)" == "Darwin" ]; then # OS X
  # make sure system is up-to-date
  sudo softwareupdate --install --all

  # install homebrew
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

  # Install homebrew apps
  brew bundle Brewfile
  rm Brewfile

  # Install homebrew-cask apps
  brew bundle Caskfile
  rm Caskfile

  # Install pip
  wget https://bootstrap.pypa.io/get-pip.py
  python get-pip.py

  # Setup Python env
  pip install livestreamer
  pip install flake8
  pip install pygments

  # Setup Ruby env
  rbenv install 2.1.2
  rbenv global 2.1.2
  rbenv rehash

  # Install latex packages
  sudo tlmgr install datetime2
  sudo tlmgr install datetime2-english
  sudo tlmgr install lacheck
  sudo tlmgr install chktex
  sudo tlmgr install IEEEconf
  sudo tlmgr install enumitem
  sudo tlmgr install xstring
  sudo tlmgr install ifplatform
  sudo tlmgr install minted
  sudo tlmgr install tracklang
  sudo tlmgr install cleveref
  sudo tlmgr install placeins
  sudo tlmgr install pgfplots
  sudo tlmgr install pgfplotstable
  sudo tlmgr install multirow
  sudo tlmgr install authblk
  sudo tlmgr install titlesec

  # Install gems
  gem install --no-ri --no-rdoc bundler 
  gem install --no-ri --no-rdoc lunchy
  gem install --no-ri --no-rdoc tmuxinator
  gem install --no-ri --no-rdoc powder
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then # Linux
  # need rbenv, ruby-build, pyenv
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then # Windows
  # need rbenv, ruby-build, pyenv
fi

# Install vundle plugins
vim +PluginInstall +qall

# Set shell to zsh
chsh -s /bin/zsh

# Set up tmux plugin manager (TPM)
# start a server but don't attach to it
tmux start-server
# create a new session but don't attach to it either
tmux new-session -d
# install the plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh
# killing the server is not required
tmux kill-server

# Finally, delete myself
echo "All done installing Martin's dotfiles."
rm -- "$0"
