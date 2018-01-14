# If you come from bash you might have to change your $PATH.
# Set initial PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  common-aliases
  compleat
  git
  osx
  zsh-256color
)

source $ZSH/oh-my-zsh.sh

# User configuration
#######################################

# Set 256 colors terminal
# TERM=xterm-256color


# Editor
#######################################
# Add nvim OS-X install to PATH
NVIM_PATH="$HOME/nvim-osx64"
if [ -d "$NVIM_PATH" ]; then
  PATH="$NVIM_PATH/bin":$PATH
fi

# Use neovim if this is installed
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Set default editors to be vim
export VISUAL=vim
export EDITOR="$VISUAL"


# Git
#######################################
# Global gitignore
git config --global core.excludesfile ~/.gitignore
# Aliasses
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.lga "log --graph --pretty=oneline --abbrev-commit --decorate --all"
git config --global alias.st "status -sbu"
# Settings
git config --global help.autocorrect 1
git config --global color.ui true
git config --global core.autocrlf input
git config --global color.diff.meta "blue black bold"
git config --global core.editor vim
git config --global push.default simple


# Configure ls
#######################################
# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# cd aliases
#######################################
# Navigation
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


# Alias misc
#######################################
# untar
alias untar='tar xvf'
# Always enable colored `grep` output
alias grep='grep --color=auto '
# History
alias h='history'
# Alias for sourcing this file easily
alias zshrc='source ~/.zshrc'


# Anaconda Python
#######################################
export SANS_ANACONDA_PATH="$PATH"
export CONDA_PATH="$HOME/anaconda3/bin"

activate_conda() {
      export PATH="$CONDA_PATH:$SANS_ANACONDA_PATH"
}

deactivate_conda() {
      export PATH="$SANS_ANACONDA_PATH"
}

# Activate conda by default
activate_conda

# Run homebrew without conda by default
brew () {
  deactivate_conda
  command brew "$@"
  activate_conda
}
