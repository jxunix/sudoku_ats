PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

all: sudoku

sudoku: sudoku.dats
	$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $^

clean:
	rm -f *~ *_ats.c

cleanall:
	clean \
	rm -f sudoku

.PHONY: all clean cleanall
