# Add `packages` directory to `TEXINPUTS` env var so pdftex can find custom packages
# Directory is relative, so it looks for a packages/ directory 
# within the directory where the tex file being compiled is located.
TEXINPUTS := ./packages/:$(TEXINPUTS)
export TEXINPUTS

TEX=pdflatex -shell-escape
NOTES_DIR=notes

.PHONY: notes

notes:
	cd $(NOTES_DIR) && $(TEX) dalgo.tex

clean:  # Remove all temporary files
	find . \( -name "*.aux" -o -name "*.log" -o -name "*.out" -o -name "*.toc" -o -name "*.pyg" \) -exec rm {} +
	find . -name "*.bak0" -exec rm {} +
	find . \( -name "*.bbl" -o -name "*.blg" \) -exec rm {} +
	find . \( -name "*.glg" -o -name "*.glo" -o -name "*.gls" -o -name "*.ist" \) -exec rm {} +
	find . \( -name "*.fdb_latexmk" -o -name "*.fls" \) -exec rm {} +
	find . \( -name "*.gz" -o -name "*.lof" -o -name "*.lot" -o -name "*.run.xml" \) -exec rm {} +

clean-all: clean  # Remove all temporary files and the generated pdf
	find . -name "*.pdf" -exec rm {} +