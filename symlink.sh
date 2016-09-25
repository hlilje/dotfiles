#! /bin/sh
# A script to create symlinks from home to all the dotfiles.

dotfiles="$HOME/Dropbox/dotfiles/.*"

for file in $dotfiles; do
    f=`basename $file`
    # Ignore certain 'files'
    if [ "$f" != "." ] && [ "$f" != ".." ] && [ "$f" != ".git" ]
    then
        if [ ! -e ~/$f ] ; then
            ln -s ~/Dropbox/dotfiles/$f ~/$f
        else
            echo "File $f already exists"
        fi
    fi
done

if [ $? -ne 0 ]; then
    echo "There were errors"
else
    echo "Symlinks created without errors"
fi

exit 0
