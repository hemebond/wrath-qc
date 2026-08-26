CC=fteqcc
# CFLAGS=-Wno-mundane
CFLAGS=-Wall

all: progs.dat csprogs.dat menu.dat

progs.dat:
	$(CC) $(CFLAGS) -srcfile ssqc/progs.src

csprogs.dat:
	$(CC) $(CFLAGS) -srcfile csqc/progs.src

menu.dat:
	$(CC) $(CFLAGS) -srcfile menuqc/progs.src
