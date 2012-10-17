# Makefile to perform housekeeping operations for PyDSTool distributions
# - Change newlines in files to unix format
# - Remove .o, .so, ~ files, etc. and any errant .svn directories (for release)
#
# Erik Sherwood (sherwood@cam) 16OCT06

.PHONY: clean cleanup unixify

# Remove object files, bytecode
clean:
	rm -rf *.so *.o *.pyc *~

cleanup:
	rm -rf *.pyc *~
	rm -rf tests/*.so tests/dop853_* tests/radau5_* tests/auto_* tests/fort.* tests/*.pkl tests/dopri853_temp
	rm -f .DS_Stor*


# Change newlines to unix format
# Endings: .txt, .py, .c, .f, .cc, .h, .hh, .html .csh .sh .c.dev .dat .py.lib .py.works .out .i 
# Plain files: README, Makefile, makefile

unixify:
	chmod u+x convert2unix.sh ; \
	find . \( -name '*.txt' -o -name '*.py' -o -name '*.c' -o -name '*.f' -o -name '*.cc' -o -name '*.h' -o -name '*.hh' -o -name '*.html' -o -name '*.csh' -o -name '*.sh' -o -name '*.c.dev' -o -name '*.dat' -o -name '*.py.lib' -o -name '*.py.works' -o -name '*.out' -o -name '*.i' -o -name 'Makefile' -o -name 'makefile' -o -name 'README' \) -exec ./convert2unix.sh '{}' \; 

