# OS-specific settings
OS=`uname`

######## Oh My Zsh Configuration ########
# Path to Oh My Zsh installation
export ZSH=$HOME/.oh-my-zsh

# Theme to load, set to 'random' for random theme
ZSH_THEME="hlilje"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Command execution time stamp shown in the history command output
HIST_STAMPS="yyyy-mm-dd"

######## Oh My Zsh Plugin Settings ########
# Plugins to load
plugins=(git tmux colored-man-pages vundle vi-mode)

# Automatically start a tmux session
ZSH_TMUX_AUTOSTART="true"

######## Scripts ########
# Source startup script
source $ZSH/oh-my-zsh.sh

# Add substring history search
source $ZSH/plugins/history-substring-search/history-substring-search.zsh

# Always source virtualenvwrapper
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/hlilje/google-cloud-sdk/path.zsh.inc' ]; then . '/home/hlilje/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/hlilje/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/hlilje/google-cloud-sdk/completion.zsh.inc'; fi

######## Exports ########
# Enable 256 colours for terminal
export TERM=xterm-256color

# Display unicode properly
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Use Vim as text editor
export VISUAL=vim
export EDITOR=vim

# Don't install gems as root
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

######## Zsh Configuration ########
# Remove right prompt trailing space
ZLE_RPROMPT_INDENT=0

# Enable Vi commands
set -o vi

# Disable bell
unsetopt BEEP

######## Aliases ########
if [[ "$OS" == 'Linux' ]]; then
    # apt aliases
    alias autoremove="sudo apt autoremove"
    alias clean="sudo apt clean"
    alias dist-upgrade="sudo apt dist-upgrade"
    alias install="sudo apt install"
    alias purge="sudo apt purge"
    alias remove="sudo apt remove"
    alias search="sudo apt search"
    alias update="sudo apt update"
    alias upgrade="sudo apt upgrade"

    # Easier dotfiles access
    alias dotfiles="cd /mnt/d/User\ Files/Dropbox/dotfiles"
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

    # Easier dotfiles access
    alias dotfiles="cd ~/Dropbox/dotfiles"
fi

# Exit all tmux sessions quickly
alias exitall="tmux kill-server"

######## Key Bindings ########
# Workaround for tmux/Zsh bug
bindkey '^R' history-incremental-search-backward
