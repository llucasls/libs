HEADERS_DIR   := /usr/local/include/ravenl
HEADERS_FILES := $(wildcard headers/*.h)
HEADERS       := $(HEADERS_FILES:headers/%=$(HEADERS_DIR)/%)

LIB_DIR := /usr/local/lib

ifeq ($(strip $(HEADERS_DIR)),)
$(error HEADERS_DIR is empty. Please specify a valid path.)
endif

ifeq ($(strip $(LIB_DIR)),)
$(error LIB_DIR is empty. Please specify a valid path.)
endif

TARGET_GROUP := $(findstring ravenl,$(file </etc/group))

ifeq ($(strip $(TARGET_GROUP)),ravenl)
GROUP := -g $(TARGET_GROUP)
endif

GET_MODE = $(if $(filter %.so,$1),755,644)
