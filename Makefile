CC=fteqcc
CFLAGS=-Wall -Wno-F302 -Wno-Q207
# CFLAGS=-Wno-mundane
# CFLAGS=-Wno-Q207
# F302: Potentially uninitialised variable
# F314: Implicit cast from class
# Q207: duplicate definition ignored

all: ../progs.dat ../csprogs.dat ../menu.dat wrath.fgd

../progs.dat: $(shell find . -name '*.qc' -o -name '*.h')
	$(CC) $(CFLAGS) -srcfile ssqc/progs.src

../csprogs.dat: $(shell find . -name '*.qc' -o -name '*.h')
	$(CC) $(CFLAGS) -srcfile csqc/progs.src

../menu.dat: $(shell find . -name '*.qc' -o -name '*.h')
	$(CC) $(CFLAGS) -srcfile menuqc/progs.src

wrath.fgd: $(shell find . -name '*.qc' -o -name '*.h')
	python3 ./qc2fgd.py --srcfile ssqc/progs.src wrath.fgd
