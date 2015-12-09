# Load my custom exports and aliases
for file in ~/.{exports,aliases,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

alias ls='gls --color=auto --group-directories-first'

# Load antigen
source $HOME/.antigen/antigen.zsh

## Antigen modules
#antigen use oh-my-zsh
antigen bundle robbyrussell/oh-my-zsh plugins/brew-cask
antigen bundle robbyrussell/oh-my-zsh plugins/aws
#antigen bundle robbyrussell/oh-my-zsh plugins/brew
antigen bundle robbyrussell/oh-my-zsh plugins/colored-man-pages
antigen bundle robbyrussell/oh-my-zsh plugins/docker
antigen bundle robbyrussell/oh-my-zsh plugins/fancy-ctrl-z

antigen bundle git
antigen bundle git-flow
#antigen bundle github
antigen bundle powder
antigen bundle battery
antigen bundle cabal
antigen bundle colorize
#antigen bundle gem
#antigen bundle rbenv
#antigen bundle rsync
antigen bundle tmux
antigen bundle tmuxinator
antigen bundle pip
antigen bundle python
antigen bundle ssh-agent
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

# Antigen theme
# antigen theme Fapper/dotfiles /.zsh/themes/martin
# antigen theme agnoster
# antigen theme https://gist.github.com/3750104.git agnoster

# Apply
antigen apply

# Instantiate rbenv with zsh
eval "$(rbenv init -)"

# Instantiate pyenv with zsh
# eval "$(pyenv init -)"

# Load theme in this repo
# source ~/.zsh/themes/martin.zsh-theme

eval `gdircolors ~/.solarized-dark.dircolors`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Load powerline
powerline-daemon -q
source /usr/local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

# Make incremental search work
bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history
