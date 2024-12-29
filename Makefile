CC:=clang
CFLAGS+=-g
INCLUDE:=-Iinclude
.PHONY:all clean

SRCS:=$(wildcard src/*.c)
OBJS:=$(SRCS:src/%.c=obj/%.o)

all:bin/befunge.exe

$(OBJS):obj/%.o:src/%.c
	$(CC) $(CFLAGS) $(INCLUDE) -c -o $@ $<
bin/befunge.exe:$(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

clean :
	-rm obj/*.o
	-rm bin/*.exe