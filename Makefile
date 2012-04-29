# Makefile for fastavro project
#
# Since we distribute the generated C file for simplicity (and so that end users
# won't need to install cython). You can re-create the C file using this
# Makefile.


ifndef PYTHON
    PYTHON=python
endif

_%.c: %.py
	cp $< $(<D)/_$(<F)
	cython $(<D)/_$(<F)
	rm $(<D)/_$(<F)

c_files = fastavro/_six.c fastavro/_reader.c

all: $(c_files)

clean:
	rm -f $(c_files)

fresh: clean all

.PHONY: all clean fresh
