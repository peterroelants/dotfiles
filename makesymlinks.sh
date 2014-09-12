#!/bin/bash
#######################################
# Create symlinks from files in this directory to the corresponding
# dot files in the home directory.
#######################################

# Variables
#######################################
# directory with dotfiles
dotdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# files to make a symlink of
files="bash_profile vimrc gitignore_global zshrc"

# Make symlink
#######################################

# Set the directory to the dotfiles directory (dir of this script)
cd $dotdir
echo "cd $dotdir"

# Make the symlinks
for file in $files; do
    echo "Make symlink to $file"
    ln -s $dotdir/$file ~/.$file
done

# Set global gitignore file
git config --global core.excludesfile ~/.gitignore_global
