#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export BROWSER='/usr/bin/waterfox-g4'

alias pn='pnpm'
alias ls='exa'
alias v='~/.config/kitty-padding.sh'
alias r='ranger'
alias shut='shutdown now'
alias susp='systemctl suspend'
alias hiber='systemctl hibernate'
alias sshalive='ssh -v -o ServerAliveInterval=60'

# Function for taking care of syncing Obsidian vault
obsync() {
	local="/home/admin/vault"
	remote="vault:vault"
	# Sync from remote to local
	if [ "$1" = "-f" ]; then
		rclone sync $remote $local
	# Sync from local to remote
	elif [ "$1" = "-t" ]; then
		rclone sync $local $remote
	else
		echo "Enter '-f' to sync from remote to local, or '-t' to sync from local to remote"
	fi
}

# Style prompt
# PS1='[\u@\h \W]\$ '
PS1='\[\e[35m\]\W\[\e[m\] \[\e[36m\]$\[\e[m\] '

# Load Angular CLI autocompletion.
source <(ng completion script)
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/admin/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(starship init bash)"
