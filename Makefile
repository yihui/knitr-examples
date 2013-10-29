knit:
	./knitall; \
	Rscript -e "knitr::purl('094-purl.Rmd')"; \
	./k "078-chinese-big5.rnw', '078-chinese-big5.ctx', encoding='BIG5"; \
	./k "076-chinese-gb2312.rnw', '076-chinese-gb2312.TEX', encoding='GB2312"

pdf:
	for i in *.tex; do echo $$i; texi2pdf -c -q $$i; done

pandoc:
	Rscript 084-pandoc.R && Rscript 088-pandoc-embedded.R

deps:
	Rscript -e "for (i in c('ggplot2', 'mapproj', 'Hmisc', 'xtable', 'gridExtra', 'Rcpp', 'RcppArmadillo', 'diagram', 'devtools'))" \
	-e "if (!require(i, character.only=TRUE)) install.packages(i, repos='http://cran.rstudio.org')"
	Rscript -e "for (i in c('rgl'))" -e "install.packages(i, repos='http://cran.rstudio.org')"
	Rscript -e "library(devtools); library(methods); install_github('devtools', 'hadley')"
	Rscript -e "options(repos='http://cran.rstudio.org'); library(devtools); library(methods); install_github('RTikZDevice', 'JanMarvin', quick=TRUE)"

sysdeps:
	sudo apt-get install pgf latex-beamer gawk ruby ghc perl highlight optipng coffeescript pandoc asymptote graphviz && \
	sudo apt-get install --no-install-recommends qpdf texinfo texlive-latex-recommended texlive-latex-extra lmodern texlive-fonts-recommended texlive-fonts-extra texlive-extra-utils && \
	if [ -z $(which dvisvgm) ]; then sudo apt-add-repository -y ppa:martin-gieseking/ppa && sudo apt-get update -o Dir::Etc::sourcelist="sources.list.d/martin-gieseking-ppa-precise.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0" && sudo apt-get install dvisvgm; fi

diff:
	git status
	git diff && echo "$$(git diff --numstat')" > expected-diff && git diff expected-diff # BEGIN_KNITR_EXAMPLES_PATCH
	[ -z "$$(git status --porcelain expected-diff)" ] && cat expected-diff # END_KNITR_EXAMPLES_PATCH

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
