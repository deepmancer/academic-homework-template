# Makefile for compiling LaTeX document

# Variables
TEXFILE_NAME = homework
TEXFILE = $(TEXFILE_NAME).tex
OUTPUTFILE = homework.pdf

INTERMEDIATE_FILES = $(TEXFILE_NAME).aux $(TEXFILE_NAME).bbl $(TEXFILE_NAME).bcf $(TEXFILE_NAME).blg $(TEXFILE_NAME).lof $(TEXFILE_NAME).log $(TEXFILE_NAME).lot $(TEXFILE_NAME).out $(TEXFILE_NAME).run.xml $(TEXFILE_NAME).toc $(TEXFILE_NAME).synctex.gz $(TEXFILE_NAME).fls $(TEXFILE_NAME).fdb_latexmk $(TEXFILE_NAME).nav $(TEXFILE_NAME).snm $(TEXFILE_NAME).bcf $(TEXFILE_NAME).run.xml

# Default target
all: $(OUTPUTFILE)

# Compile LaTeX document
$(OUTPUTFILE): $(TEXFILE)
	pdflatex $(TEXFILE)
	bibtex $(TEXFILE_NAME)
	pdflatex $(TEXFILE)
	pdflatex $(TEXFILE)
	mv $(TEXFILE_NAME).pdf $(OUTPUTFILE)

# Clean auxiliary files
clean:
	rm -f $(INTERMEDIATE_FILES)

# Clean all generated files
cleanall: clean
	rm -f $(OUTPUTFILE)

.PHONY: all clean cleanall
