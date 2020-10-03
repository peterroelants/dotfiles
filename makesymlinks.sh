#!/bin/bash
#######################################
# Create symlinks from files in this directory to the corresponding
# dot files in the home directory.
#######################################

# Variables
#######################################
# directory with dotfiles
dotdir="$HOME/dotfiles"

# Make symlink
#######################################

# Set the directory to the dotfiles directory (dir of this script)
cd $dotdir
echo "cd $dotdir"

# Symlink bash_profile
echo "Make symlink to bashrc"
rm -f ~/.bashrc
ln -s $dotdir/bashrc ~/.bashrc

# Symlink zshrc
echo "Make symlink to zshrc"
rm -f ~/.zshrc
ln -s $dotdir/zshrc ~/.zshrc

# Symlink gitignore
echo "Make symlink to gitignore"
rm -f ~/.gitignore
ln -s $dotdir/gitignore ~/.gitignore

# Symlink init.vim
echo "Make symlink to init.vim for both vim an nvim"
rm -f ~/.config/nvim/init.vim
mkdir -p ~/.config/nvim/
ln -s $dotdir/init.vim ~/.config/nvim/init.vim

# # Symlink tmux.conf
# echo "Make symlink to tmux.conf"
# rm -f ~/.tmux.conf
# ln -s $dotdir/tmux.conf ~/.tmux.conf

# # Symlink xsessionrc
# echo "Make symlink to xsessionrc"
# rm -f ~/.xsessionrc
# ln -s $dotdir/xsessionrc ~/.xsessionrc
