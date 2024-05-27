#!/bin/bash

function prep_conda() {
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.bash' 'hook' 2>/dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
			. "$HOME/miniconda3/etc/profile.d/conda.sh"
		else
			export PATH="$HOME/miniconda3/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
}

# SINCE MANAGING PATHS WITH TMUX REMAINS A PAIN IN THE ASS...
if [ "$PATH_RC_COMPLETE" != "1" ]; then

	prep_conda
	source "$HOME/.cargo/env"
	export PATH="$HOME/bin:$PATH"
	eval "$(starship init bash)"
	eval "$(~/.cargo/bin/rtx activate bash)"
	export PATH_RC_COMPLETE=1

else
	echo "paths already initialized"
	prep_conda
fi

# DEFINED IN BASHRC
load_extras
