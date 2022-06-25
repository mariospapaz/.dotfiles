#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias vi=nvim
alias ls='ls --color=auto'

_GREEN=$(tput setaf 2)
_BLUE=$(tput setaf 4)
_RED=$(tput setaf 1)
_YELLOW=$(tput setaf 3)
_MAGENTA=$(tput setaf 5)
_CYAN=$(tput setaf 6)
_RESET=$(tput sgr0)
_BOLD=$(tput bold)

export PS1="${_YELLOW}${_BOLD}[${MAGENTA}\u@${_CYAN}\h \W ${_YELLOW}]${_RED}\$ ${_RESET}"
