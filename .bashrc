#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

# opencode
export PATH=/home/eren/.opencode/bin:$PATH
