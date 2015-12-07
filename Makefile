NAME=document
SHELL=/bin/bash
.PHONY: all dvi pdf ps clean
all: dvi pdf ps
dvi: ${NAME}.dvi
pdf: ${NAME}.pdf
ps: ${NAME}.ps

clean:
    @echo -e "\n\n### Upratovanie ###\n\n"
    -rm ${NAME}.{aux,dvi,log,pdf,ps}

${NAME}.pdf: ${NAME}.tex
	@echo -e "\n\n### PDF ###\n\n"
	vlna -r -l -m -n -v KkSsVvZzOoUuAaIi ${NAME}.tex
    pdflatex ${NAME}.tex
    biber ${NAME}.bcf
    texindy -I omega --language slovak ${NAME}.idx
    pdflatex ${NAME}.tex
