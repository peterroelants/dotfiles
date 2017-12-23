# Set initial PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Try to source .bashrc if it exists
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Alias for sourcing this file easily
alias sbash='source ~/.bash_profile'

# Set 256 colors terminal
TERM=xterm-256color


# Configure prompt
#######################################
         COLOR_RED="\[\033[0;31m\]"
   COLOR_LIGHT_RED="\[\033[1;31m\]"
      COLOR_YELLOW="\[\033[0;33m\]"
       COLOR_GREEN="\[\033[0;32m\]"
       COLOR_OCHRE="\[\033[38;5;95m\]"
        COLOR_BLUE="\[\033[0;34m\]"
  COLOR_LIGHT_BLUE="\[\033[1;34m\]"
       COLOR_WHITE="\[\033[0;37m\]"
COLOR_LIGHT_PURPLE="\[\033[1;35m\]"
  COLOR_LIGHT_CYAN="\[\033[1;36m\]"
       COLOR_RESET="\[\e[0m\]"

# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
function set_prompt_symbol () {
  if test $1 -eq 0 ; then
      PROMPT_SYMBOL="\$"
  else
      PROMPT_SYMBOL="${COLOR_LIGHT_RED}\$${COLOR_RESET}"
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
function set_bash_prompt () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
  # return value of the last command.
  set_prompt_symbol $?
  # Check if git exists and parse some info
  if is_git_repository ; then
    gbranch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    git_color
    GIT_STATUS="${GIT_STATE_COLOR}(${gbranch})${COLOR_RESET} "
  else
    GIT_STATUS=''
  fi
  # Set the bash prompt variable.
  PS1="${COLOR_GREEN}\u${COLOR_RESET}@${COLOR_LIGHT_BLUE}\h${COLOR_RESET} \w ${GIT_STATUS}${PROMPT_SYMBOL} "
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt


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

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# cd aliases
#######################################
##
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


# Anaconda Python
#######################################

export SANS_ANACONDA_PATH="$PATH"
export CONDA_PATH="$HOME/anaconda3/bin"

activate_conda() {
      export PATH="$CONDA_PATH:$SANS_ANACONDA_PATH"
}
export -f activate_conda

deactivate_conda() {
      export PATH="$SANS_ANACONDA_PATH"
}
export -f deactivate_conda

# Activate conda by default
activate_conda

# Run homebrew without conda by default
brew () {
  deactivate_conda
  command brew "$@"
  activate_conda
}
