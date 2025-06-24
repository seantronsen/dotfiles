# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
alacritty | *-256color)
	PS1="\[$(tput setaf 2)\]\u@\h:\W\[$(tput sgr0)\]$ "
	;;
*)
	PS1='\u@\h:\W\$ '
	;;
esac

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

# DEFINED IN BASHRC
load_extras
