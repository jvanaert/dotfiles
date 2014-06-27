 
rt PATH="/usr/local/bin:$PATH"

# make sure system is up-to-date
sudo softwareupdate --install --all

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

# Install homebrew apps
brew bundle Brewfile

# Python env
pip install livestreamer

# Ruby env
rbenv install 2.1.2

# Install some gems
gem install --no-ri --no-rdoc bundler 

# Install homebrew-cask apps
brew bundle Caskfile

# Bre cleanup
brew cleanup --force -s
rm -rf $(brew --cache)
