# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

################################################################################
# This function loads a configuration file from the user's home directory,
# located in the '.bash_config' subdirectory. The function requires one
# argument, which specifies the name of the configuration file to load.
#
# It exists to enable users to abstract away sections of the `.bashrc` file
# into focused modules.
#
# Globals:
# 	$HOME: The path to the user's home directory.
# Arguments:
#   $1: The name of the configuration file to load.
################################################################################
function load_config() {
	config_dir="$HOME/.bash_config"
	config_path="$config_dir/$1"
	if [ ! -d "$config_dir" ]; then
		echo "error: configuration directory '$config_dir' does not exist"
	elif [ -z "$1" ]; then
		echo "error: required argument \$1 which specifies the configuration file name was not provided"
	elif [ ! -f "$config_path" ]; then
		echo "error: the configuration file at '$config_path' does not exist"
	else
		# echo "info: loading configuration file at '$config_path'"
		source "$config_path"
	fi
}

################################################################################
# This function provides an abstraction layer, allowing users to define
# machine-specific configurations while maintaining a global configuration
# applicable to all machines using a bash shell.
#
# The routine searches for a file whose name is prefixed by the name of the
# currently interpreted file, followed by the '.extras.bash' extension. If
# such a file is found, its contents are interpreted using the `source`
# command.
#
# Globals:
#   $BASH_ARGV: The first element of the arguments vector is used to obtain
#   the name of the currently interpreted file.
################################################################################
function load_extras() {
	extension="extras.bash"
	filename_origin="${BASH_ARGV[0]}"
	filename_extras="$filename_origin.$extension"
	if [ -f "$filename_extras" ]; then
		source "$filename_extras"
	fi
}

# ADJUST PATH VAR
load_config path.bash

# CONFIGURE HISTORY
load_config history.bash

# CONFIGURE SHELL OPTS
# shopt -s globstar
# shopt -s dotglob
#
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# CONFIGURE LESS FOR VEWING FILES AND MANPAGES
load_config less.bash

# CONFIGURE COMMAND PROMPT BEHAVIOR
load_config prompt.bash

# CONFIGURE ALIASES
load_config aliases.bash

# CONFIGURE CUSTOM SHELL COMMANDS
load_config shell-commands.bash

# ADDITIONAL SHELL OPTIONS
# 

# LOAD RC EXTRAS
load_extras
