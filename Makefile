PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

all: sudoku

sudoku: sudoku.dats
	$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $^

clean:
	rm -f *~ *_dats.c

cleanall:: clean
cleanall::
	rm -f sudoku

.PHONY: all clean cleanall
