# Load dotfiles
for file in ~/.{exports,aliases,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Load antigent
source $HOME/.antigen/antigen.zsh

# Antigen modules
antigen use oh-my-zsh
antigen bundle git
antigen bundle git-flow
antigen bundle github
antigen bundle powder
antigen bundle battery
antigen bundle cabal
antigen bundle colorize
antigen bundle gem
antigen bundle rbenv
antigen bundle rsync
antigen bundle tmux
antigen bundle tmuxinator
antigen bundle python
antigen bundle ssh-agent
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

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
#antigen theme Fapper/dotfiles /.zsh/themes/martin

# Apply
antigen apply

# Load theme in this repo
source ~/.zsh/themes/martin.zsh-theme

# Instantiate rbenv with zsh
eval "$(rbenv init -)"

# Instantiate pyenv with zsh
eval "$(pyenv init -)"

eval `gdircolors ~/.solarized-dark.dircolors`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

alias ls='gls --color=auto --group-directories-first'

