#!/bin/bash
#######################################
# Create symlinks from files in this directory to the corresponding
# dot files in the home directory.
#######################################

# Variables
#######################################
# directory with dotfiles
dotdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Make symlink
#######################################

# Set the directory to the dotfiles directory (dir of this script)
cd $dotdir
echo "cd $dotdir"

# Symlink bash_profile
echo "Make symlink to bash_profile"
rm -f ~/.bash_profile
ln -s $dotdir/bash_profile ~/.bash_profile

# Symlink bash_profile
echo "Make symlink to gitignore"
rm -f ~/.gitignore
ln -s $dotdir/gitignore ~/.gitignore

# Symlink init.vim
echo "Make symlink to init.vim for both vim an nvim"
rm -f ~/.vimrc
rm -f ~/.config/nvim/init.vim
mkdir -p ~/.config/nvim/
ln -s $dotdir/init.vim ~/.config/nvim/init.vim
ln -s $dotdir/init.vim ~/.vimrc

# Symlink tmux.conf
echo "Make symlink to tmux.conf"
rm -f ~/.tmux.conf
ln -s $dotdir/tmux.conf ~/.tmux.conf
