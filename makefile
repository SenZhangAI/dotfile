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
		$(if $(wildcard $(1)), \

				@echo "    Copy $(1) to $(2);"
				@cp -i -p -u $(1) $(2); \
				echo  "    Copy Done.", \

				@echo $(1) "is not exist.")
endef

.PHONY: all config pull pull_visual_studio config_vsvim

SUBLIME_TEXT_TARGET_FILE = $(shell cygpath $$USERPROFILE)/AppData/Roaming/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
SUBLIME_TEXT_SOURCE_FILE = ./SublimeText/Preferences.sublime-settings

VSVIMRC_TARGET_FILE = $(shell cygpath $$USERPROFILE)/_vsvimrc
VSVIMRC_SOURCE_FILE = ./VisualStudio/_vsvimrc
VSSETTING_TARGET_FILE = $(shell cygpath -O)/Visual\ Studio\ 2015/Settings/Sen.vssettings
VSSETTING_SOURCE_FILE = ./VisualStudio/Sen.vssettings

# BASIC commend
all: config

config: config_visual_studio config_sublime_text

pull: pull_visual_studio pull_sublime_text

## Config Sublime Text
config_sublime_text:
ifeq ($(OS_TYPE),Cygwin)
		@echo "Config Sublime Text..."
		$(call copy, $(SUBLIME_TEXT_SOURCE_FILE), $(SUBLIME_TEXT_TARGET_FILE))
else
endif

## Pull Sublime Text
pull_sublime_text:
ifeq ($(OS_TYPE),Cygwin)
		@echo "Pull Sublime Text..."
		$(call copy, $(SUBLIME_TEXT_TARGET_FILE), $(SUBLIME_TEXT_SOURCE_FILE))
else
endif

## Config Visual Studio
config_visual_studio: config_vsvim
ifeq ($(OS_TYPE),Cygwin)
		@echo "Config VS-Settings..."
		$(call copy, $(VSSETTING_SOURCE_FILE), $(VSSETTING_TARGET_FILE))
else
endif

## Pull Visual Studio
pull_visual_studio: pull_vsvim
ifeq ($(OS_TYPE),Cygwin)
		@echo "Pull VS-Settings..."
		$(call copy, $(VSSETTING_TARGET_FILE), $(VSSETTING_SOURCE_FILE))
else
endif

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
