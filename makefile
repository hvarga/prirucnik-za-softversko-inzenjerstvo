build:
	@echo "Generating PDF file..."
	@git log -1 --format=\\verb+%H+ > book/current_commit.tex
	
	@# We need to call latexmk to generate all the data necessary to generate a PDF.
	latexmk -verbose -time -pdf -cd book/main.tex
	
	@mv book/main.pdf book/prirucnik_za_softversko_inzenjerstvo.pdf
	
	@echo "PDF file generated at `pwd`/book/prirucnik_za_softversko_inzenjerstvo.pdf."
clean:
	@find book | egrep "(current_commit.tex|*.aux$$|*.log$$|*.pdf$$|*.out$$|*.toc$$|*.lof$$|*.bbl$$|*.blg$$|*.xml$$|*blx.bib$$|*synctex.gz$$|*.lol$$|*.idx$$|*.ilg$$|*.ind$$|*.fdb_latexmk$$|*.fls$$)" | xargs --no-run-if-empty rm
	@echo "Everything clean."
