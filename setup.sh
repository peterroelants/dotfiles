#!/usr/bin/env bash
#######################################
# Create symlinks from files in this directory to the corresponding
# dot files in the home directory.
#######################################

# Variables
#######################################
# directory with dotfiles
setup_script_path=`realpath $0`
dotdir=`dirname $setup_script_path`
echo "Dotfiles directory = $dotdir"


# Make symlink
#######################################

# Set the directory to the dotfiles directory (dir of this script)
cd $dotdir
echo "cd $dotdir"

# Symlink aliases
echo "Make symlink to aliases"
rm -f ~/.aliases
ln -s $dotdir/aliases ~/.aliases

# Symlink bash_profile
echo "Make symlink to bashrc"
rm -f ~/.bashrc
ln -s $dotdir/bashrc ~/.bashrc

# Symlink zshrc
echo "Make symlink to zshrc"
rm -f ~/.zshrc
ln -s $dotdir/zshrc ~/.zshrc
# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Symlink gitignore_global
echo "Make symlink to gitignore_global"
rm -f ~/.gitignore_global
ln -s $dotdir/gitignore_global ~/.gitignore_global

# Symlink gitconfig
echo "Make symlink to gitconfig"
rm -f ~/.gitconfig
ln -s $dotdir/gitconfig ~/.gitconfig

# Symlink condarc
echo "Make symlink to condarc"
rm -f ~/.condarc
ln -s $dotdir/condarc ~/.condarc

# Install VSCode extensions
echo "Install VSCode extensions"
# Create list with `code --list-extensions > extensions.txt`
cat $dotdir/vscode_extensions.txt | xargs -L 1 code --force --install-extension

# Symlink VSCode settings
echo "Make symlink to vscode settings"
rm -f ~/.config/Code/User/settings.json
ln -s $dotdir/vscode_settings.json ~/.config/Code/User/settings.json

# Symlink init.vim
echo "Make symlink to init.vim for nvim"
rm -f ~/.config/nvim/init.vim
mkdir -p ~/.config/nvim/
ln -s $dotdir/init.vim ~/.config/nvim/init.vim

# Install vim plugins
echo "Install vim-plug"
# https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Install vim plugins"
nvim --headless +PlugInstall +qall

# Setup Gnome Terminal Theme
$dotdir/config_gnome_terminal.sh

# # Symlink tmux.conf
# echo "Make symlink to tmux.conf"
# rm -f ~/.tmux.conf
# ln -s $dotdir/tmux.conf ~/.tmux.conf

# # Symlink xsessionrc
# echo "Make symlink to xsessionrc"
# rm -f ~/.xsessionrc
# ln -s $dotdir/xsessionrc ~/.xsessionrc


# Set theme
#######################################
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'


# Remap Keyboard
#######################################
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
