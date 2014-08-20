build:
	@echo "Generating PDF file..."
	@git log -1 --format=\\verb+%H+ > book/current_commit.tex
	
	@# We need to call pdflatex and bibtex to generate all the data necessary to generate a PDF.
	@cd book && pdflatex -halt-on-error -jobname=prirucnik_za_softversko_inzenjerstvo main.tex > /dev/null
	@cd book && bibtex prirucnik_za_softversko_inzenjerstvo.aux > /dev/null
	@cd book && pdflatex -halt-on-error -jobname=prirucnik_za_softversko_inzenjerstvo main.tex > /dev/null
	
	@echo "PDF file generated at `pwd`/book/prirucnik_za_softversko_inzenjerstvo.pdf."
clean:
	@find book | egrep "(current_commit.tex|*.aux$$|*.log$$|*.pdf$$|*.out$$|*.toc$$|*.lof$$|*.bbl$$|*.blg$$|*.xml$$|*blx.bib$$|*synctex.gz$$)" | xargs --no-run-if-empty rm
	@echo "Everything clean."
