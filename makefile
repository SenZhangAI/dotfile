# OS detected
ifeq ($(OS),Windows_NT)
	ifneq ($(findstring .exe,$(SHELL)),)
    OS_TYPE := Windows
	else
    OS_TYPE := Cygwin
	endif
else
    OS_TYPE := $(shell uname -s)
endif

# $(1) source file
# $(2) target file
define copy
		$(if $(wildcard $(1)), @cp -i -p -u $(1) $(2), \
				@echo $(1) "is not exist.")
endef

.PHONY: all config pull pull_visual_studio config_vsvim

VSVIMRC_TARGET_FILE = $(shell cygpath $$USERPROFILE)/_vsvimrc
VSVIMRC_SOURCE_FILE = ./VisualStudio/_vsvimrc

# BASIC commend
all: config

config: config_visual_studio

pull: pull_visual_studio

## Config Visual Studio
config_visual_studio: config_vsvim

## Pull Visual Studio
pull_visual_studio: pull_vsvim

### Config vsvim
config_vsvim:
ifeq ($(OS_TYPE),Cygwin)
		@echo "Config VsVim..."
		$(call copy, $(VSVIMRC_SOURCE_FILE), $(VSVIMRC_TARGET_FILE))
else
endif

### Pull vsvim
pull_vsvim:
ifeq ($(OS_TYPE),Cygwin)
		@echo "Pull VsVim..."
		$(call copy, $(VSVIMRC_TARGET_FILE), $(VSVIMRC_SOURCE_FILE))
else
endif
