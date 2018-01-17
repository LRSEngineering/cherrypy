
# cherrypy.mk
# Makefile to include building sqlobject in a larger top-level project
# Copyright (C) 2018 Long Range Systems, LLC.  All rights reserved.

ifndef CHERRYPY_SRC_DIR
  CHERRYPY_SRC_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
endif

ifndef BUILD_TOOLS_DIR
  ${error BUILD_TOOLS_DIR not defined! You must specify where build tools reside}
endif

# greenlet package version
CHERRYPY_PV = 1.4.1

# Build revision
CHERRYPY_PR = -r1

# Overall build version
CHERRYPY_BV = $(CHERRYPY_PV)$(CHERRYPY_PR)


CHERRYPY_DOTFILE = $(call python-cross-dotfile,cherrypy,$(CHERRYPY_BV))

CHERRYPY_DEPS = $(CHERRYPY_DOTFILE)

$(CHERRYPY_DOTFILE): $(BUILD_PYTHON_NATIVE_MODULE_DEPS)
	$(call build-python-native-module,$(CHERRYPY_SRC_DIR))
	touch $@
