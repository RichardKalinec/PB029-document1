NAME=document
SHELL=/bin/bash
.PHONY: all pdf clean
all: pdf
pdf: ${NAME}.pdf

clean:
	@echo -e "\n\n### Upratovanie ###\n\n"
	-rm ${NAME}.{log,aux,dvi,lof,lot,bit,idx,glo,bbl,bcf,ilg,toc,ind,out,blg,fdb_latexmk,fls,run.xml,synctex.gz}

${NAME}.pdf: ${NAME}.tex
	@echo -e "\n\n### PDF ###\n\n"
	vlna -r -l -m -n -v KkSsVvZzOoUuAaIi ${NAME}.tex
	pdflatex ${NAME}.tex
	biber ${NAME}.bcf
	texindy -I omega --language slovak ${NAME}.idx
	pdflatex ${NAME}.tex
