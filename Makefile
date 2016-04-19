
# Source files directory (input)
SRCDIR = ./source
# Template files directory (input)
TPLDIR = ./templates
# Raw LaTeX directory (output)
TEXDIR = ./latex
# PDF directory (output)
PDFDIR = ./pdf
# HTML directory (output)
HTMDIR = ./html
# EPUB directory (output)
EBKDIR = ./epub

TITLE = $(SRCDIR)/title.txt
CHAPTERS = $(wildcard $(SRCDIR)/*.md)

BUILD = build
BOOKNAME = my-book
METADATA = metadata.xml
TOC = --toc --toc-depth=2
COVER_IMAGE = images/cover.jpg
LATEX_CLASS = report
MAINFONT = "Droid Serif"
FONT_SIZE = 1.2em
SANSFONT = "Alegreya SC"
MONOFONT = "Alegreya SC"

all: book

book: epub html pdf

# Delete intermediate files
clean:
	rm -rf $(TEXDIR)

# Delete all output files
clobber:
	make clean
	rm -rf $(PDFDIR) $(HTMDIR) $(EBKDIR)

pdf: pdf/$(BOOKNAME).pdf

pdf/$(BOOKNAME).pdf: $(TITLE) $(CHAPTERS) $(TPLDIR)/template.tex
	mkdir -p $(PDFDIR)
	pandoc $(TITLE) $(CHAPTERS) \
	  --output=$@ \
	  --latex-engine=xelatex \
	  --template=$(TPLDIR)/template.tex

#pandoc $(TOC) -N --template=templatePdf.tex --variable mainfont=$(MAINFONT) --variable fontsize=$(FONT_SIZE) --variable sansfont=$(SANSFONT) --variable monofont=$(MONOFONT) --latex-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $@ $^



epub: $(BUILD)/epub/$(BOOKNAME).epub

html: $(BUILD)/html/$(BOOKNAME).html

$(BUILD)/epub/$(BOOKNAME).epub: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/epub
	pandoc $(TOC) -S --epub-metadata=$(METADATA) --epub-cover-image=$(COVER_IMAGE) -o $@ $^

$(BUILD)/html/$(BOOKNAME).html: $(CHAPTERS)
	mkdir -p $(BUILD)/html
	pandoc $(TOC) --standalone --to=html5 -o $@ $^



.PHONY: all book clean clobber epub html pdf



