build:
	@echo "Generating PDF file..."
	@git log -1 --format=\\verb+%H+ > book/current_commit.tex
	
	@# We need to call pdflatex, bibtex and makeindex to generate all the data necessary to generate a PDF.
	@cd book && pdflatex -halt-on-error main.tex > /dev/null
	@cd book && bibtex main.aux > /dev/null
	@cd book && makeindex -q main > /dev/null
	@cd book && pdflatex -halt-on-error main.tex > /dev/null
	@cd book && pdflatex -halt-on-error main.tex > /dev/null
	
	@mv book/main.pdf book/prirucnik_za_softversko_inzenjerstvo.pdf
	
	@echo "PDF file generated at `pwd`/book/prirucnik_za_softversko_inzenjerstvo.pdf."
clean:
	@find book | egrep "(current_commit.tex|*.aux$$|*.log$$|*.pdf$$|*.out$$|*.toc$$|*.lof$$|*.bbl$$|*.blg$$|*.xml$$|*blx.bib$$|*synctex.gz$$|*.lol$$|*.idx$$|*.ilg$$|*.ind$$)" | xargs --no-run-if-empty rm
	@echo "Everything clean."
