function prep_conda() {
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/Users/stronsen/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "/Users/stronsen/miniconda3/etc/profile.d/conda.sh" ]; then
			. "/Users/stronsen/miniconda3/etc/profile.d/conda.sh"
		else
			export PATH="$HOME/miniconda3/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
}
# BECAUSE MANAGING PATHS WITH TMUX REMAINS A PAIN IN MY ASS...
if [ "$PATH_RC_COMPLETE" != "1" ]; then
	echo "initializing paths for shell environment"
	export PATH="/opt/homebrew/bin:$PATH"
	export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
	export PATH="/usr/local/texlive/2024/bin/universal-darwin:$PATH"
	prep_conda
	export PATH_RC_COMPLETE=1
else
	echo "paths already initialized"
	prep_conda
fi

if [ -d "/Applications/Docker.app/Contents/Resources/bin" ]; then
	export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin"
fi
