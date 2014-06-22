###### oh-my-zsh configuration
# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

### Theme to load
# Location: ~/.oh-my-zsh/themes/
# Set to 'random' for random theme
ZSH_THEME="mh"

# Use case-sensitive completion
#CASE_SENSITIVE="true"

# Disable bi-weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Change how often to auto-update (in days)
#export UPDATE_ZSH_DAYS=13

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty, makes repository
# status check for large repositories much faster
#DISABLE_UNTRACKED_FILES_DIRTY="true"

# Change the command execution time stamp shown in the history command output
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

###### oh-my-zsh plugin settings
### Plugins to load
# Plugin location: ~/.oh-my-zsh/plugins/*
# Custom plugin location: ~/.oh-my-zsh/custom/plugins/
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

### Aliases
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

# Exit all tmux sessions quickly
alias exitall="tmux kill-server"
