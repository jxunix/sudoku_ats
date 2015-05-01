######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######
#
all:: \
solve
all:: \
animation_dats.js
#
solve: \
solve.dats board.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
#
animation_dats.c: animation.dats; $(PATSCC) -ccats $<
#
board_dats.c: board.dats; $(PATSCC) -ccats $<
#
animation_dats.js: animation_dats.c board_dats.c; $(ATSCC2JS) -o $@ -i $<
######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) *_dats.js solve

###### end of [Makefile] ######
