################################################################################
# Print the path collection/stack used by the shell environment with each path
# displayed on a separate line. The typical use case for this command is to
# debug the environment when multiple versions of the same package/library are
# present, but the expected version is not used due to another option being
# prioritized by unix path order of appearance based precedance.
#
# Outputs:
# 	The contents of the $PATH environment variable are output line by line
################################################################################
function path-print() {
	echo $PATH | sed 's/:/\n/g'
}

# DEFINED IN BASHRC
load_extras
