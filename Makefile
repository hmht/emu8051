#####################################################################
# Config
#####################################################################
BIN := emu

CFLAGS += -O2
CFLAGS += -pipe
CFLAGS += -g -Wall -Wextra -Wno-unused-parameter

# Uncomment to activate LTO
#CFLAGS += -flto

LDLIBS += -lcurses

#####################################################################
# Rules
#####################################################################
HEADERS := $(wildcard *.h)
SRC := $(wildcard *.c)
OBJ := $(SRC:.c=.o)

%.o: %.c $(HEADERS)
	 $(CC) $(CFLAGS) $(LDFLAGS) -c -o $@ $<

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)

clean:
	-rm -f $(BIN) $(OBJ)

.PHONY: clean all

all: $(BIN)
