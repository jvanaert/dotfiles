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

# Setup Ruby env
rbenv install 2.1.2
rbenv global 2.1.2
rbenv rehash

# Install Ruby bundler gem 
gem install --no-ri --no-rdoc bundler 

# Set shell to zsh
chsh -s /bin/zsh

# Delete myself
echo "All done installing Martin's dotfiles."
rm -- "$0"
