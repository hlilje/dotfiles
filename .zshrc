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

# X Server clipboard fix on Windows
if [[ "$OS" == 'Linux' ]]; then
    export DISPLAY=localhost:0.0
fi

######## Zsh Configuration ########
# Remove right prompt trailing space
ZLE_RPROMPT_INDENT=0

# Enable Vi commands
set -o vi

# Disable bell
unsetopt BEEP

######## Aliases ########
# Exit all tmux sessions quickly
alias exitall="tmux kill-server"

######## Key Bindings ########
# Workaround for tmux/Zsh bug
bindkey '^R' history-incremental-search-backward
