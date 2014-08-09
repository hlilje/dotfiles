# Linux exports
OS=`uname`
if [[ "$OS" == 'Linux' ]]; then
    # Add go app engine to path
    export PATH=/home/hlilje/go_appengine:$PATH

    # Add TestU01 to path
    export PATH=/home/hlilje/Dropbox/Education/dkand14/random-algorithm/test/TestU01:$PATH

    # Golang
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin

    # Used for Test01
    export LD_LIBRARY_PATH=/home/hlilje/Dropbox/Education/dkand14/random-algorithm/test/TestU01/lib:${LD_LIBRARY_PATH}
    export LIBRARY_PATH=/home/hlilje/Dropbox/Education/dkand14/random-algorithm/test/TestU01/lib:${LIBRARY_PATH}
    export C_INCLUDE_PATH=/home/hlilje/Dropbox/Education/dkand14/random-algorithm/test/TestU01/include:${C_INCLUDE_PATH}
    export CPLUS_INCLUDE_PATH=/home/hlilje/Dropbox/Education/dkand14/random-algorithm/test/TestU01/include:${C_INCLUDE_PATH}
elif [[ "$OS" == 'Darwin' ]]; then
    # Use Homebrew before system programs
    export PATH="/usr/local/bin:$PATH"
fi
