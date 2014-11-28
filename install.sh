cd ~
# Remove .git directory copied over from bootstrap.sh
rm -rf .git/ 
rm .gitmodules
rm .gitignore

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

# Install vundle plugins
vim +PluginInstall +qall

# Setup Python env
pip install livestreamer
pip install flake8
pip install pygments

# Setup Ruby env
rbenv install 2.1.2
rbenv global 2.1.2
rbenv rehash

# Install gems
gem install --no-ri --no-rdoc bundler 
gem install --no-ri --no-rdoc lunchy

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
