# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

function load_config() {
	config_dir="$HOME/.bash_config"
	config_path="$config_dir/$1"
	if [ -z "$1"]; then
		echo "error: required argument \$1 which specifies the configuration file was not provided."
	elif [ ! -f "$config_path" ]; then
		echo "error: the configuration file at '$config_path' does not exist"
	else
		# echo "info: loading configuration file at '$config_path'"
		source "$config_path"
	fi
}

# # ADJUST PATH VAR
load_config path.bash
#
# # CONFIGURE HISTORY
load_config history.bash
#
# CONFIGURE SHELL OPTS
shopt -s checkwinsize
shopt -s globstar
# shopt -s dotglob
#
# CONFIGURE LESS FOR VEWING FILES AND MANPAGES
load_config config_less.bash
#
# CONFIGURE COMMAND PROMPT BEHAVIOR
load_config prompt_config.bash
#
# CONFIGURE ALIASES
load_config aliases.bash

# CONFIGURE CUSTOM SHELL COMMANDS
load_config shell-commands.bash

# MACROS
builtin bind -x '"\e[17~":"bash $HOME/bin/fzf-dir-to-tmux-session"'
builtin bind -x '"\e[15~":"bash $HOME/bin/server-status"'
# source "$HOME/sources/spack/share/spack/setup-env.sh"
# source "$HOME/sources/spack/share/spack/bash/spack-completion.bash"

# ADDITIONAL SHELL OPTIONS
export TERM="tmux-256color"

# SUPPORT FOR FLATPAK
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"
