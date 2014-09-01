# Add '~/bin' to path
export PATH="$HOME/bin:$PATH"

# Load dotfiles
for file in ~/.{exports,aliases,extra}; do
  [-r "$file"] && [ -f "$file" ] && source "$file";
done;
unset file;


source $HOME/.zsh-antigen/antigen/antigen.zsh

# Antigen modules
antigen use oh-my-zsh
antigen bundle git
antigen bundle osx
# antigen bundle ruby
# antigen bundle rvm
# antigen bundle textmate
antigen bundle zsh-users/zsh-syntax-highlighting

# Antigen theme
antigen theme Fapper/dotfiles .zsh/themes/martin

# Apply
antigen apply

# Path
#PATHDIRS=(
#/usr/local/bin
#/usr/local
#/usr/bin
#/usr/sbin
#/sbin
#/usr/local/sbin
#/usr/texbin
##$HOME/.rvm/bin/
#$HOME/bin
#)
#path=($path $dir)

# Instantiate rbenv with zsh
eval "$(rbenv init -)"
