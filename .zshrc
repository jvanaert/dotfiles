# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="martin"
#ZSH_THEME="rbates"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git ruby brew node npm osx screen github svn zsh-syntax-highlighting)
plugins=(git osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Path
PATHDIRS=(
/usr/local/bin
/usr/local
/usr/bin
/usr/sbin
/sbin
/usr/local/sbin
/usr/texbin
$HOME/.rvm/bin/
$HOME/bin
)

path=($path $dir)

# Make rake work with zsh
alias rake="noglob rake"

# added RVM stuff
# # load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

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

PATH=$PATH:$HOME/.rvm/bin:/usr/local/gnat/bin:$HOME/bin
