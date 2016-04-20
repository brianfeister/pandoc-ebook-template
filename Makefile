# Source files directory (input)
SRCDIR = ./source
# Template files directory (input)
TPLDIR = ./templates
# Filters directory (input)
FILDIR = ./filters
# Raw LaTeX directory (output)
TEXDIR = ./tex
# PDF directory (output)
PDFDIR = ./pdf
# HTML directory (output)
HTMDIR = ./html
# EPUB directory (output)
EBKDIR = ./epub

# Phony targets

.PHONY: all book clean clobber epub html pdf

# File lists and names

TITLE = $(SRCDIR)/title.txt
CHAPTERS = $(wildcard $(SRCDIR)/*.md)
BOOKNAME = my-book

# Shortcuts

all: book

book: epub html pdf

# Delete intermediate files

clean:
	rm -rf $(TEXDIR)

# Delete all output files

clobber:
	make clean
	rm -rf $(PDFDIR) $(HTMDIR) $(EBKDIR)

# LaTeX sourcecode production

tex: $(TEXDIR)/$(BOOKNAME).tex

$(TEXDIR)/$(BOOKNAME).tex: $(TITLE) $(CHAPTERS) $(TPLDIR)/template.tex
	mkdir -p $(TEXDIR)
	pandoc $(TITLE) $(CHAPTERS) \
	  --filter=$(FILDIR)/custom-tables.hs \
	  --output=$@ \
	  --template=$(TPLDIR)/template.tex
	perl -S -pi -e 's/\\begin{longtable}/\\begin{xtabular*}{\\linewidth}/g' $@
	perl -S -pi -e 's/\\end{longtable}/\\end{xtabular*}/g' $@

# PDF production (from LaTeX sourcecode)

pdf: $(PDFDIR)/$(BOOKNAME).pdf

$(PDFDIR)/$(BOOKNAME).pdf: $(TEXDIR)/$(BOOKNAME).tex
	mkdir -p $(PDFDIR)
	latexmk \
	  $(TEXDIR)/$(BOOKNAME).tex \
	  -output-directory=$(TEXDIR) \
	  --xelatex
	mv $(TEXDIR)/$(BOOKNAME).pdf $(PDFDIR)

# OTHER DESTINATIONS

BUILD = build
METADATA = metadata.xml
TOC = --toc --toc-depth=2
COVER_IMAGE = images/cover.jpg

epub: $(BUILD)/epub/$(BOOKNAME).epub

html: $(BUILD)/html/$(BOOKNAME).html

$(BUILD)/epub/$(BOOKNAME).epub: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/epub
	pandoc $(TOC) -S --epub-metadata=$(METADATA) --epub-cover-image=$(COVER_IMAGE) -o $@ $^

$(BUILD)/html/$(BOOKNAME).html: $(CHAPTERS)
	mkdir -p $(BUILD)/html
	pandoc $(TOC) --standalone --to=html5 -o $@ $^

