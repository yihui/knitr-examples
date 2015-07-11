knit:
	./knitall


pdf:
	for i in *.tex; do echo $$i; texi2pdf -c -q $$i; done

pandoc:
	Rscript 084-pandoc.R && Rscript 088-pandoc-embedded.R

deps:
	Rscript -e "for (i in readLines('R-packages'))" \
	-e "if (!require(i, character.only=TRUE)) install.packages(i)" \
	-e "update.packages(.libPaths(), instlib = .libPaths()[1], ask = FALSE)"
	(kpsewhich Sweave.sty || tlmgr conf texmf TEXMFHOME "~/texmf:/usr/share/R/share/texmf")

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

xvfb-%:
	sh -e /etc/init.d/xvfb $*

diff:
	git status
	git diff
	git checkout -- 009-*.md 010-*.md 021-*.tex 101-*.md 051-*.tex  # ignore these differences
	[ -z "$$(git diff)" ] || exit 1

clean:
	$(RM) *.log *.aux *.toc *.nav *.out *.snm *.vrb *.docx *.epub *.odt 084-pandoc-slides.html; \
	ls *.Rmd | sed 's/\.Rmd$$/.html/' | xargs $(RM); \
	find figure/ | grep -E 'figure/[^0-9]' | xargs $(RM); \
	find cache/ | grep -E 'cache/[^0-9]' | xargs $(RM)

strip:
	for i in `ls | grep -E '^[0-9].*\.(brew|R(nw|md|tex|html|rst|textile))$$'`; do sed -i "s/[[:space:]]*$$//" $$i; done

