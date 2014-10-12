# Add '~/bin' to path
export PATH="$HOME/bin:$PATH"

# Add sbin to path
export PATH="/usr/local/sbin:$PATH"

# Load dotfiles
for file in ~/.{exports,aliases,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  thencomplete -o default -o nospace -F _git g;
 fi;

source $HOME/.zsh-antigen/antigen/antigen.zsh

# Antigen modules
antigen use oh-my-zsh
antigen bundle git
antigen bundle osx
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

# Instantiate pyenv with zsh
eval "$(pyenv init -)"

# Set locale info
export LC_ALL=da_DK.UTF-8  
export LANG=da_DK.UTF-8
