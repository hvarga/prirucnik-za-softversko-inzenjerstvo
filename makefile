build:
	@echo "Generating PDF file..."
	@git log -1 --format=\\newcommand{\\commitid}{%H} > book/current_commit.tex
	@git log -1 --date=iso --format=\\newcommand{\\commitdate}{%ad} >> book/current_commit.tex
	
	@# We need to call latexmk to generate all the data necessary to generate a PDF.
	@mkdir book/build
	latexmk -r book/latexmkrc -verbose -time -latexoption='-halt-on-error -synctex=1' -pdf -cd book/main.tex -jobname=build/main
	
	@cp book/build/main.pdf book/build/prirucnik_za_softversko_inzenjerstvo.pdf
	
	@echo "PDF file generated at `pwd`/book/build/prirucnik_za_softversko_inzenjerstvo.pdf."
clean:
	@rm -rf book/build
	@rm -rf book/current_commit.tex
	@echo "Everything clean."
