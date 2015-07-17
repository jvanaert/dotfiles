cd ~
# Remove .git directory copied over from bootstrap.sh
rm -rf .git/ 
rm .gitmodules
rm .gitignore

# Install vim-plug to manage vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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

  # Setup Python env
  pyenv install 2.7
  pyenv install 3.4.3
  pyenv global 2.7 3.4.3
  pyenv rehash

  # Install pip
  wget https://bootstrap.pypa.io/get-pip.py
  python get-pip.py

  # Setup Python env
  pip install livestreamer
  pip install flake8
  pip install pygments
  pip install "requests[security]"
  pip install howdoi

  # Setup Ruby env
  rbenv install 2.1.2
  rbenv global 2.1.2
  rbenv rehash

  # Install gems
  gem install --no-ri --no-rdoc bundler 
  gem install --no-ri --no-rdoc lunchy
  gem install --no-ri --no-rdoc tmuxinator
  gem install --no-ri --no-rdoc powder

  # Node
  npm install -g jshint
  npm install -g bower

  # LaTeX
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
  sudo tlmgr install todonotes 
  sudo tlmgr install siunitx
  sudo tlmgr install csv
  sudo tlmgr install import 
  sudo tlmgr install collection-latexrecommended
  sudo tlmgr install collection-fontsrecommended
  sudo tlmgr install collection-fontsrecommended
  sudo tlmgr install collection-fontsrecommended
  sudo tlmgr install collection-fontsrecommended
  sudo tlmgr install unicode-math
  sudo tlmgr install filehook
  sudo tlmgr install textpos 
  sudo tlmgr install biblatex 
  sudo tlmgr install logreq 
  sudo tlmgr install fontawesome
  sudo tlmgr install biber 
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then # Linux
  # need rbenv, ruby-build, pyenv
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then # Windows
  # need rbenv, ruby-build, pyenv
fi

# Install vim plugins
vim +PlugInstall +qall

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
