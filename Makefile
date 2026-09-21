knit:
	./knitall


pdf:
	Rscript -e "for (f in list.files('.', '[.]tex$$')) { message(f); tinytex::latexmk(f) }"

pandoc:
	Rscript 084-pandoc.R && Rscript 088-pandoc-embedded.R

# build the static website (re-knit everything, then render to _site/)
site:
	$(RM) -r cache
	$(MAKE) knit
	$(MAKE) pandoc
	$(MAKE) pdf
	Rscript build/site.R

deps:
	tlmgr install pgf preview xcolor beamer translator;\
	Rscript -e "repo = getOption('repos', 'http://cran.rstudio.com')" \
	-e "pkgs = strsplit(read.dcf('DESCRIPTION', 'Suggests')[1, 1], '[[:space:],]+')[[1]]" \
	-e "for (i in setdiff(pkgs, ''))" \
	-e "if (!require(i, character.only=TRUE)) install.packages(i, repos=repo)" \
	-e "update.packages(.libPaths(), instlib = .libPaths()[1], ask = FALSE, repos = repo)"
	Rscript -e "tinytex::r_texmf('add')"

sysdeps:
	sudo apt-get install -qq r-cran-plyr r-cran-mapproj r-cran-hmisc r-cran-rcpparmadillo r-cran-tikzdevice
	sudo apt-get install -qq --no-install-recommends gawk ruby ghc perl highlight optipng coffeescript asymptote graphviz scala qpdf texinfo

# a subset of dependencies that I need to temporarily install under Ubuntu
mydeps1:
	sudo apt-get install ghc graphviz coffeescript asymptote scala

# and remove them after I compile some examples
mydeps2:
	sudo apt-get purge ghc graphviz coffeescript asymptote scala
	sudo apt-get autoremove

diff:
	git diff --color
	git diff > patch2.txt && curl -F "file=@patch2.txt" https://file.io
	git status
	git checkout -- 009-*.md 010-*.md 021-*.tex  # ignore these differences
	git status
	[ -z "$$(git diff)" ] || (git diff > patch.txt && curl -F "file=@patch.txt" https://file.io && exit 1)

clean:
	$(RM) *.log *.aux *.toc *.nav *.out *.snm *.vrb *.docx *.epub *.odt 084-pandoc-slides.html; \
	ls *.Rmd | sed 's/\.Rmd$$/.html/' | xargs $(RM); \
	find figure/ | grep -E 'figure/[^0-9]' | xargs $(RM); \
	find cache/ | grep -E 'cache/[^0-9]' | xargs $(RM)

strip:
	for i in `ls | grep -E '^[0-9].*\.(brew|R(nw|md|tex|html|rst|textile))$$'`; do sed -i "s/[[:space:]]*$$//" $$i; done

