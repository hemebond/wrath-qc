CFLAGS=-Wno-mundane
# CFLAGS=

progs.dat:
	fteqcc64 $(CFLAGS) -srcfile ssqc/progs.src

csprogs.dat:
	fteqcc64 $(CFLAGS) -srcfile csqc/progs.src

menu.dat:
	fteqcc64 $(CFLAGS) -srcfile menuqc/progs.src
