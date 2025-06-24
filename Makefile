SHELL::=/bin/bash
.ONESHELL:

DIR_CONFS::=confs
SRCS=$(patsubst ${DIR_CONFS}/%,%, $(shell find ${DIR_CONFS} -type f))

# todo: create platform specific recipes (e.g., debian12, alma10, rocky9, macos14, etc.)
# todo: clean this up. it should autogen recipes for each file in confs instead of doing this loop
all:
	for f in ${SRCS}; do 
		if [ ! -d "$$HOME/$$(dirname $$f)" ]; then 
			mkdir -vp "$$HOME/$$(dirname $$f)"; 
		fi; 
		ln -vfst "$$HOME/$$(dirname $$f)" "$$(realpath ${DIR_CONFS}/$$f)" 
	done
