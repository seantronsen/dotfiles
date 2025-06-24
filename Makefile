# todo: create platform specific recipes (e.g., debian12, alma10, rocky9, macos14, etc.)
# todo: clean this up. it should autogen recipes for each file in confs instead of doing this loop
define run-installer
@echo "linking configuration for $@ software"
@cd $@; \
for f in $$(find . -type f); do \
	if [ ! -d "$${HOME}/$$(dirname $$f)" ]; then  \
		mkdir -vp '$${HOME}/$$(dirname $$f)'; \
	fi;  \
	ln -vfst "$${HOME}/$$(dirname $$f)" "$$(realpath $$f)";  \
done
endef

.PHONY: default
default:
	@echo "warning: choose a platform to target"

.PHONY: common
common:
	$(run-installer)

.PHONY: linux
linux: common
	$(run-installer)

.PHONY: macos
macos: common
	$(run-installer)
