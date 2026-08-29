CC=fteqcc
# CFLAGS=-Wall
# CFLAGS=-Wno-mundane
CFLAGS=-Wno-Q207
# warning F302: Potentially uninitialised variable
# warning F314: Implicit cast from class

all: progs.dat csprogs.dat menu.dat

progs.dat:
	$(CC) $(CFLAGS) -srcfile ssqc/progs.src

csprogs.dat:
	$(CC) $(CFLAGS) -srcfile csqc/progs.src

menu.dat:
	$(CC) $(CFLAGS) -srcfile menuqc/progs.src
