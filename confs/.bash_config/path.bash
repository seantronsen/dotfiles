if [ ! -d "$HOME/.local/bin" ]; then 
	mkdir -vp "$HOME/.local/bin"
fi
export PATH="$HOME/.local/bin:$PATH"

if [ -f "$HOME/.cargo/env" ]; then 
	source "$HOME/.cargo/env"
fi

# DEFINED IN BASHRC
load_extras
