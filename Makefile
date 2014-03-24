knit:
	./knitall


pdf:
	for i in *.tex; do echo $$i; texi2pdf -c -q $$i; done

pandoc:
	Rscript 084-pandoc.R && Rscript 088-pandoc-embedded.R

deps:
	Rscript -e "for (i in c('ggplot2', 'mapproj', 'Hmisc', 'xtable', 'gridExtra', 'Rcpp', 'RcppArmadillo', 'diagram'))" \
	-e "if (!require(i, character.only=TRUE)) install.packages(i, repos='http://cran.rstudio.org')"
	Rscript -e "for (i in c('rgl', 'devtools'))" -e "install.packages(i, repos='http://cran.rstudio.org')" \
					-e "devtools::install_github('hadley/ggplot2', ref='f15fb6fb545e')"
	Rscript -e "install.packages('tikzDevice', repos=c('http://rforge.net', 'http://cran.rstudio.org'))"

sysdeps:
	sudo apt-get install --no-install-recommends pgf latex-beamer gawk ruby ghc perl highlight optipng coffeescript pandoc asymptote graphviz scala qpdf texinfo texlive-latex-recommended texlive-latex-extra lmodern texlive-fonts-recommended texlive-fonts-extra texlive-extra-utils && \
	if [ -z "$$(which dvisvgm)" ]; then sudo apt-add-repository -y ppa:martin-gieseking/ppa && sudo apt-get update -o Dir::Etc::sourcelist="sources.list.d/martin-gieseking-ppa-precise.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0" && sudo apt-get install dvisvgm; fi

# a subset of dependencies that I need to temporarily install under Ubuntu
mydeps1:
	sudo apt-get install ghc graphviz coffeescript asymptote scala

# and remove them after I compile some examples
mydeps2:
	sudo apt-get remove ghc graphviz coffeescript asymptote scala
	sudo apt-get autoremove

xvfb-%:
	sh -e /etc/init.d/xvfb $*

diff:
	git status
	git diff # BEGIN_KNITR_EXAMPLES_PATCH
	git checkout -- 009-*.md 010-*.md 021-*.tex 101-*.md  # ignore these differences # END_KNITR_EXAMPLES_PATCH
	[ -z "$$(git diff)" ] || exit 1

clean:
	$(RM) *.log *.aux *.toc *.nav *.out *.snm *.vrb *.docx *.epub *.odt 084-pandoc-slides.html; \
	ls *.Rmd | sed 's/\.Rmd$$/.html/' | xargs $(RM); \
	find figure/ | grep -E 'figure/[^0-9]' | xargs $(RM); \
	find cache/ | grep -E 'cache/[^0-9]' | xargs $(RM)

strip:
	for i in `ls | grep -E '^[0-9].*\.(brew|R(nw|md|tex|html|rst|textile))$$'`; do sed -i "s/[[:space:]]*$$//" $$i; done

mount:
	sshfs yihui@r-forge.r-project.org:/srv/gforge/chroot/home/groups/animation/htdocs/knitr-ex ./r-forge

unmount:
	fusermount -u ./r-forge

sync:
	cp -u ./figure/*.png ./figure/*.svg ./r-forge/figure/
