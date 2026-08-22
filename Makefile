CFLAGS=-Wno-mundane
# CFLAGS=

all: ../progs.dat ../csprogs.dat ../menu.dat

../progs.dat:
	fteqcc64 $(CFLAGS) -srcfile ssqc/progs.src

../csprogs.dat:
	fteqcc64 $(CFLAGS) -srcfile csqc/progs.src

../menu.dat:
	fteqcc64 $(CFLAGS) -srcfile menuqc/progs.src
