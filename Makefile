SRC := src
LIB := lib
HEADERS := $(CURDIR)/headers

CC     = gcc
CFLAGS = -Wall -Wextra -Werror

STATIC_FLAGS  = -c -I$(HEADERS)
DYNAMIC_FLAGS = -shared -fPIC -I$(HEADERS)

OBJECTS        = $(patsubst $(SRC)/%.c,$(LIB)/%.o,$(wildcard $(SRC)/*.c))
SHARED_OBJECTS = $(patsubst $(SRC)/%.c,$(LIB)/lib%.so,$(wildcard $(SRC)/*.c))

all: static dynamic

static: $(OBJECTS)

dynamic: $(SHARED_OBJECTS)

$(LIB)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) $(STATIC_FLAGS) -o $@ $<

$(LIB)/lib%.so: $(SRC)/%.c
	$(CC) $(CFLAGS) $(DYNAMIC_FLAGS) -o $@ $<

clean:
	if test -n "$(OBJECTS)"; then rm -f $(OBJECTS); fi
	if test -n "$(SHARED_OBJECTS)"; then rm -f $(SHARED_OBJECTS); fi

.PHONY: all static dynamic clean

.SILENT: clean
