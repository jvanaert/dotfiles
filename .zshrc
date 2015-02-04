# Load dotfiles
for file in ~/.{exports,aliases,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

source $HOME/.zsh-antigen/antigen/antigen.zsh

# Antigen modules
antigen use oh-my-zsh
antigen bundle git
antigen bundle github
antigen bundle powder
antigen bundle osx
antigen bundle brew
antigen bundle brew-cask
antigen bundle battery
antigen bundle cabal
antigen bundle colorize
antigen bundle gem
antigen bundle rbenv
antigen bundle rsync
antigen bundle tmux

# Antigen theme
antigen theme Fapper/dotfiles /.zsh/themes/martin

# Apply
antigen apply

# Enable zsh-completions
# https://github.com/zsh-users/zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Instantiate rbenv with zsh
eval "$(rbenv init -)"

# Instantiate pyenv with zsh
eval "$(pyenv init -)"

eval `gdircolors ~/.solarized-dark.dircolors`
alias ls='gls --color=auto --group-directories-first'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
