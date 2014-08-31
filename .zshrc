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

PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Instantiate rbenv with zsh
eval "$(rbenv init -)"

# Make rake work with zsh
alias rake="noglob rake"

alias ls='ls -G -p'

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias ga='git add'
alias gs='git status'
alias gb='git branch'
alias gp='git push'
alias gl='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias go='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git'
alias get='git'

alias mvim='mvim --remote-silent'
alias archey='archey -c'

alias bx='bundle exec'

alias hist='history  | grep -m 10'

alias top='htop'
