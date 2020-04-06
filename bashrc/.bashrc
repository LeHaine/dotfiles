#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias emacs="emacs -nw"
alias bb="sudo bleachbit --clean system.cache system.localizations system.trash system.tmp"
alias cc="sudo cacheclean 2"
