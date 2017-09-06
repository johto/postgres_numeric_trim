MODULE_big = numeric_trim
OBJS = numeric_trim.o

EXTENSION = numeric_trim
DATA = numeric_trim--1.0.sql

REGRESS = numeric_trim

ifdef NO_PGXS
subdir = contrib/numeric_trim
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
else
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
endif
