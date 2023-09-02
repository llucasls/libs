include config.mk

CC     = gcc
CFLAGS = -Wall -Wextra -Werror

STATIC_FLAGS  = -c
DYNAMIC_FLAGS = -shared -fPIC

SRC_FILES = $(wildcard src/*.c)

STATIC_OBJECTS = $(SRC_FILES:src/%.c=lib/%.o)
SHARED_OBJECTS = $(SRC_FILES:src/%.c=lib/lib%.so)

OBJECTS := $(patsubst lib/%,$(LIB_DIR)/%,$(wildcard lib/*))

all: dynamic

install: all headers libraries

headers: $(HEADERS)

libraries: $(OBJECTS)

static: $(STATIC_OBJECTS)

dynamic: $(SHARED_OBJECTS)

$(HEADERS): $(HEADERS_DIR)/%: headers/% | $(HEADERS_DIR)
	install $(GROUP) -m 644 $< $@

$(OBJECTS): $(LIB_DIR)/%: lib/%
	install $(GROUP) -m $(call GET_MODE,$@) -D $< $@

$(STATIC_OBJECTS): lib/%.o: src/%.c
	$(CC) $(CFLAGS) $(STATIC_FLAGS) -o $@ $<

$(SHARED_OBJECTS): lib/lib%.so: src/%.c
	$(CC) $(CFLAGS) $(DYNAMIC_FLAGS) -o $@ $<

$(HEADERS_DIR):
	install $(GROUP) -m 775 -d $@

clean:
	if test -n "$(STATIC_OBJECTS)"; then rm -f $(STATIC_OBJECTS); fi
	if test -n "$(SHARED_OBJECTS)"; then rm -f $(SHARED_OBJECTS); fi

.PHONY: all install headers libraries static dynamic clean

.SILENT: clean
