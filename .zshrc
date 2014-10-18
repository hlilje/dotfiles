# OS-specific settings
OS=`uname`

###### oh-my-zsh configuration
# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

### Theme to load
# Set to 'random' for random theme
ZSH_THEME="mh"
#ZSH_THEME="hlilje"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Command execution time stamp shown in the history command output
HIST_STAMPS="yyyy-mm-dd"

###### oh-my-zsh plugin settings
### Plugins to load
plugins=(git tmux colored-man vundle vi-mode)

# Automatically start a tmux session
ZSH_TMUX_AUTOSTART="true"

###### Scripts
# Source startup script
source $ZSH/oh-my-zsh.sh

# Add substring history search
source $ZSH/plugins/history-substring-search/history-substring-search.zsh

###### zsh configuration
# Enable Vi commands
set -o vi

# Enable 256 colours for terminal
export TERM=xterm-256color

# Used for adk lab
#export LC_COLLATE=C

###### Aliases
# Easier home access
alias gh="cd ~"

# Easier dotfiles access
alias dotfiles="cd ~/Dropbox/dotfiles"

# mvk project shortcut
alias qwait="cd ~/Dropbox/Education/mvk13/qwait"

# dkand project shortcut
alias dkand="cd ~/Dropbox/Education/dkand14/random-algorithm"

# komp project shortcut
alias komp="cd ~/Dropbox/Education/komp14/compiler"

# komp project shortcut
alias dgi="cd ~/Dropbox/Education/dgi14/project"

# Start IntelliJ IDEA
alias idea="/opt/idea-IC-135.480/bin/idea.sh"

if [[ "$OS" == 'Linux' ]]; then
    # apt-get aliases
    alias autoremove="sudo apt-get autoremove"
    alias clean="sudo apt-get clean"
    alias dist-upgrade="sudo apt-get dist-upgrade"
    alias install="sudo apt-get install"
    alias purge="sudo apt-get purge"
    alias remove="sudo apt-get remove"
    alias search="sudo apt-get search"
    alias update="sudo apt-get update"
    alias upgrade="sudo apt-get upgrade"
elif [[ "$OS" == 'Darwin' ]]; then
    # Brew aliases
    alias doctor="brew doctor"
    alias cleanup="brew cleanup"
    alias install="brew install"
    alias list="brew list"
    alias remove="brew remove"
    alias search="brew search"
    alias update="brew update"
    alias upgrade="brew upgrade"
fi

# Exit all tmux sessions quickly
alias exitall="tmux kill-server"

###### Key Bindings
# Workaround for tmux/zsh bug
bindkey '^R' history-incremental-search-backward
