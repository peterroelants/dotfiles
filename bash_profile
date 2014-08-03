# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# aliases
alias cd..="cd .."
alias l="ls -al"
alias lp="ls -p"
alias h=history
alias ls='ls -GFh'

# add colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
PS1_OLD=${PS1}
export TERM="xterm-color"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '
