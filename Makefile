latex:
	xelatex -shell-escape protokol.tex
	bibtex protokol
	xelatex protokol.tex
	xelatex protokol.tex


clean:
	rm -rf *.aux
	rm -rf *.bbl
	rm -rf *.blg
	rm -rf *.fdb_latexmk
	rm -rf *.fls
	rm -rf *.log
	rm -rf *.synctex.gz
	rm -rf *-gnuplottex-*
	rm -rf *.gnuploterrors
	rm -rf *.tmp
	rm -f protokol.out

clean-all: clean
	rm -rf protokol.pdf

gnuplot:
	for i in *.gnuplot; do gnuplot $$i; done