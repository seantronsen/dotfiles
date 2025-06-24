if [ ! -d "$HOME/.local/bin" ]; then 
	mkdir -vp "$HOME/.local/bin"
fi
export PATH="$HOME/.local/bin:$PATH"

if [ -d "$HOME/bin" ]; then 
	export PATH="$HOME/bin:$PATH"
fi

if [ -f "$HOME/.cargo/env" ]; then 
	source "$HOME/.cargo/env"
fi

# DEFINED IN BASHRC
load_extras
