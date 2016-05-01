# Source files directory (input)
SRCDIR = ./source
# Preprocessed source files directory (input)
PREDIR = ./preprocessed
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

META = $(SRCDIR)/book.yaml
CHAPTERS = $(wildcard $(SRCDIR)/*.md)

ALLSRC = $(wildcard $(SRCDIR)/*.md)
ALLPRE = $(patsubst $(SRCDIR)/%.md,$(PREDIR)/%.md,$(ALLSRC))

BOOKNAME = book

# Shortcuts

all: book

book: epub html pdf

# Delete intermediate files

clean:
	rm -rf $(PREDIR) $(TEXDIR)

# Delete all output files

clobber:
	make clean
	rm -rf $(PDFDIR) $(HTMDIR) $(EBKDIR)

# Markdown sourcecode preprocessing

pre: $(ALLPRE)

$(PREDIR)/%.md :
	mkdir -p $(PREDIR)
	cp $(SRCDIR)/$*.md $(PREDIR)
	perl -S -pi -e 's/\+\+\++\s*{\s*\.(.*?)( |}).*/<div class="\1">/' $@
	perl -S -pi -e 's/\+\+\++.*/<\/div>/' $@


# LaTeX sourcecode production

tex: $(TEXDIR)/$(BOOKNAME).tex

$(TEXDIR)/$(BOOKNAME).tex: $(META) $(ALLPRE) $(TPLDIR)/template.tex
	mkdir -p $(TEXDIR)
	pandoc $(META) $(ALLPRE) \
	  --filter=$(FILDIR)/callouts.hs \
	  --filter=$(FILDIR)/tables.hs \
	  --output=$@ \
	  --template=$(TPLDIR)/template.tex
	perl -S -pi -e 's/\\begin{longtable}.*/\\begin{VariaTable}/g' $@
	perl -S -pi -e 's/\\end{longtable}/\\end{VariaTable}/g' $@
	perl -S -pi -e 's/\\begin{figure}.*/\\begin{VariaFigure}/g' $@
	perl -S -pi -e 's/\\end{figure}/\\end{VariaFigure}/g' $@

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

$(BUILD)/epub/$(BOOKNAME).epub: $(META) $(CHAPTERS)
	mkdir -p $(BUILD)/epub
	pandoc $(TOC) -S --epub-metadata=$(METADATA) --epub-cover-image=$(COVER_IMAGE) -o $@ $^

$(BUILD)/html/$(BOOKNAME).html: $(CHAPTERS)
	mkdir -p $(BUILD)/html
	pandoc $(TOC) --standalone --to=html5 -o $@ $^

