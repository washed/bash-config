#!/bin/bash
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Source git prompt extensions
source ~/bin/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1

function get_hostname {
  export SHORTNAME=""
}

function user_color {
  id | grep "Admin" > /dev/null
  RETVAL=$?
  if [[ $RETVAL == 0 ]]; then
    usercolor="[0;32m";
  else
    usercolor="[0;32m";
  fi
}

function settitle() {
  u=${USERNAME}
  h="$u@${HOSTNAME}: $PWD"
  echo -ne "\e]2;$h\a\e]1;$h\a";
}

# Set directory colors
eval `dircolors ~/.dir_colors`

# Set prompt and window title
inputcolor='[0;37m'
cwdcolor='[0;34m'
host_name='[1;31m'
user_color
PROMPT_COMMAND='settitle; get_hostname; history -a;'

export PS1='\[\e${cwdcolor}\][$PWD]\[\e${usercolor}\][\u]\[\e${host_name}\]$(__git_ps1) \[\e${inputcolor}\] $ '

# Aliases
alias ls='ls -l --color'
alias grep='grep -n --color'
