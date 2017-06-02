# zmodload zsh/zprof

source ~/.exports
source ~/.aliases
source ~/.extra

# for file in ~/.{exports,aliases,extra}; do
#   [ -r "$file" ] && [ -f "$file" ] && source "$file";
# done;
# unset file;

# Load antigen
source /usr/local/share/antigen/antigen.zsh

# Load various lib files
antigen bundle robbyrussell/oh-my-zsh lib/
# antigen bundle robbyrussell/oh-my-zsh plugins/aws
antigen bundle robbyrussell/oh-my-zsh plugins/colored-man-pages
# antigen bundle robbyrussell/oh-my-zsh plugins/docker
# antigen bundle robbyrussell/oh-my-zsh plugins/fancy-ctrl-z

antigen bundle git
# antigen bundle git-flow
#antigen bundle github
#antigen bundle powder
# antigen bundle cabal
# antigen bundle colorize
#antigen bundle rsync
antigen bundle tmux
# antigen bundle tmuxinator

# Ruby
# antigen bundle rbenv
# antigen bundle gem

# Python
# antigen bundle pip
# antigen bundle python
# antigen bundle virtualenv

# Node
# antigen bundle node
# antigen bundle npm
# antigen bundle lukechilds/zsh-nvm

antigen bundle ssh-agent
antigen bundle zsh-users/zsh-completions
# antigen bundle zsh-users/zsh-history-substring-search # possibly not needed now that I have fzf
antigen bundle zsh-users/zsh-autosuggestions

# zsh-syntax-highlighting must be the last plugin sourced
antigen bundle zsh-users/zsh-syntax-highlighting

# # OS specific plugins
# if [[ $CURRENT_OS == 'OS X' ]]; then
#   # antigen bundle brew
#   # antigen bundle brew-cask
#   # antigen bundle osx
# elif [[ $CURRENT_OS == 'Linux' ]]; then
#   # None so far...
# elif [[ $CURRENT_OS == 'Cygwin' ]]; then
#   antigen bundle cygwin
# fi

# Antigen theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Apply
antigen apply

# rbenv() {
#   eval "$(command rbenv init -)"
#   rbenv "$@"
# }

# rbenv() {
#   eval "$(command pyenv init -)"
#   pyenv "$@"
# }

# # eval `gdircolors ~/.solarized-dark.dircolors`
# # zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# # alias ls='gls --color=auto --group-directories-first'

# # added by travis gem
# [ -f /Users/martin/.travis/travis.sh ] && source /Users/martin/.travis/travis.sh

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# # https://github.com/chriskempson/base16-shell
# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# # source ~/.iterm2_shell_integration.zsh
# eval "$(direnv hook zsh)"

# # zprof
