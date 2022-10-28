#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export BROWSER='/usr/bin/waterfox-g4'

alias ls='ls --color=auto'
alias nv='~/.config/kitty-padding.sh'
alias shut='shutdown now'
alias susp='systemctl suspend'
alias hiber='systemctl hibernate'

# Function for taking care of syncing Obsidian vault
obsync () {
  local="~/vault"
  remote="vault:vault"
  # Sync from remote to local
  if [ "$1" = "-f" ]; then
    rclone sync -i $remote $local 
  elif [ "$1" = "-t" ]; then
    rclone sync -i $local $remote
  else 
    echo "Enter '-f' to sync from remote to local, or '-t' to sync from local to remote"
  fi
}

# Style prompt
# PS1='[\u@\h \W]\$ '
PS1='\[\e[35m\]\W\[\e[m\] \[\e[36m\]$\[\e[m\] '


# Load Angular CLI autocompletion.
source <(ng completion script)
