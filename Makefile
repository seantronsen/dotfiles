SHELL::=/bin/bash
.ONESHELL:

DIR_CONFS::=confs
SRCS=$(patsubst ${DIR_CONFS}/%,%, $(shell find ${DIR_CONFS} -type f))

all:
	for f in ${SRCS}; do 
		if [ ! -d "$$HOME/$$(dirname $$f)" ]; then 
			mkdir -vp "$$HOME/$$(dirname $$f)"; 
		fi; 
		ln -vfst "$$HOME/$$(dirname $$f)" "$$(realpath ${DIR_CONFS}/$$f)" 
	done
