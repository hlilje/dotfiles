# OS-specific settings
OS=`uname`

if [[ "$OS" == 'Linux' ]]; then
    # App Engine
    export PATH=/home/hlilje/go_appengine:$PATH

    # Go
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
elif [[ "$OS" == 'Darwin' ]]; then
    # Use Homebrew before system programs
    export PATH="/usr/local/bin:$PATH"

    # Display unicode properly
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
fi
