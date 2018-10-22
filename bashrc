# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Set initial PATH
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"

# Alias for sourcing this file easily
alias sbash='source ~/.bashrc'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Set 256 colors terminal
TERM=xterm-256color

# http://linuxcommand.org/lc3_adv_tput.php
COLOR_RED="$(tput setaf 1)"
COLOR_LIGHT_RED="$(tput setaf 1; tput bold)"
COLOR_YELLOW="$(tput setaf 3)"
COLOR_GREEN="$(tput setaf 2)"
COLOR_BLUE="$(tput setaf 4)"
COLOR_LIGHT_BLUE="$(tput setaf 4; tput bold)"
COLOR_WHITE="$(tput setaf 7)"
COLOR_LIGHT_PURPLE="$(tput setaf 5; tput bold)"
COLOR_LIGHT_CYAN="$(tput setaf 6; tput bold)"
COLOR_RESET="$(tput sgr0)"


# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
function set_prompt_symbol_color () {
  if test $1 -eq 0 ; then
      PROMPT_SYMBOL_COLOR=""
  else
      PROMPT_SYMBOL_COLOR="${COLOR_LIGHT_RED}"
  fi
}

# Set the git status color
function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ${git_status} =~ "working directory clean" ]]; then
    GIT_STATE_COLOR="${COLOR_GREEN}"
  elif  [[ ${git_status} =~ "working tree clean" ]]; then
      GIT_STATE_COLOR="${COLOR_GREEN}"
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    GIT_STATE_COLOR="${COLOR_YELLOW}"
  elif [[ ${git_status} =~ "nothing added to commit but untracked files present" ]]; then
    GIT_STATE_COLOR="${COLOR_GREEN}"
  else
    GIT_STATE_COLOR="${COLOR_LIGHT_RED}"
  fi
}

# Detect whether the current directory is a git repository.
function is_git_repository {
  git branch > /dev/null 2>&1
}

# Set the full bash prompt.
# https://bash.cyberciti.biz/guide/Changing_bash_prompt
function set_bash_prompt () {
  # Set the color of the PROMPT symbol
  set_prompt_symbol_color $?
  # Check if git exists and parse some info
  if is_git_repository ; then
    GIT_BRANCH="($(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'))"
    git_color
  else
    GIT_BRANCH=''
    GIT_STATE_COLOR=''
  fi
  # Don't set PS1 or things like conda envs won't be properly displayed.
}
# Set command prompt function to call when the prompt is loaded
PROMPT_COMMAND="set_bash_prompt"
# Set the formatting of the first prompt line
PS1="[\!] \[$COLOR_GREEN\]\u\[$COLOR_RESET\]@\[$COLOR_LIGHT_BLUE\]\h\[$COLOR_RESET\] \w \[\$GIT_STATE_COLOR\]\$GIT_BRANCH\[$COLOR_RESET\] \[\$PROMPT_SYMBOL_COLOR\]\$\[$COLOR_RESET\] "


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
# Add dark themed colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# added by Anaconda3 installer
. $HOME/anaconda3/etc/profile.d/conda.sh
