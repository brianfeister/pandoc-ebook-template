BUILD = build
BOOKNAME = my-book
TITLE = title.txt
METADATA = metadata.xml
CHAPTERS = ch01.md ch02.md
TOC = --toc --toc-depth=2
COVER_IMAGE = images/cover.jpg
LATEX_CLASS = report
MAINFONT = "Droid Serif"
FONT_SIZE = 1.2em
SANSFONT = "Alegreya SC"
MONOFONT = "Alegreya SC"

all: book

book: epub html pdf

clean:
	rm -rf $(BUILD)

epub: $(BUILD)/epub/$(BOOKNAME).epub

html: $(BUILD)/html/$(BOOKNAME).html

pdf: $(BUILD)/pdf/$(BOOKNAME).pdf

$(BUILD)/epub/$(BOOKNAME).epub: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/epub
	pandoc $(TOC) -S --epub-metadata=$(METADATA) --epub-cover-image=$(COVER_IMAGE) -o $@ $^

$(BUILD)/html/$(BOOKNAME).html: $(CHAPTERS)
	mkdir -p $(BUILD)/html
	pandoc $(TOC) --standalone --to=html5 -o $@ $^

$(BUILD)/pdf/$(BOOKNAME).pdf: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/pdf
	pandoc $(TOC) -N --template=templatePdf.tex --variable mainfont=$(MAINFONT) --variable fontsize=$(FONT_SIZE) --variable sansfont=$(SANSFONT) --variable monofont=$(MONOFONT) --latex-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $@ $^

.PHONY: all book clean epub html pdf
