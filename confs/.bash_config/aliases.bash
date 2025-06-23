# Alias definitions.

# enable color support of ls and also add handy aliases
if command -v dircolors &>/dev/null && [ -x "$(command -v dircolors)" ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# misc 
if command -v i3lock; then
	alias i3lock="i3lock -c 000000" # todo: move to system extras
fi

# DEFINED IN BASHRC
load_extras
