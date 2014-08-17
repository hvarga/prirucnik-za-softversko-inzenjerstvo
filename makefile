build:
	@echo "Generating PDF file..."
	@git log -1 --format=\\verb+%H+ > book/current_commit.tex
	
	@# We need to call pdflatex twice to generate all data.
	@cd book && pdflatex -jobname=prirucnik_za_softversko_inzenjerstvo main.tex > /dev/null
	@cd book && pdflatex -jobname=prirucnik_za_softversko_inzenjerstvo main.tex > /dev/null
	
	@echo "PDF file generated at `pwd`/book/prirucnik_za_softversko_inzenjerstvo.pdf."
clean:
	@find book | egrep "(current_commit.tex|*.aux$$|*.log$$|*.pdf$$|*.out$$|*.toc$$)" | xargs --no-run-if-empty rm
	@echo "Everything clean."
