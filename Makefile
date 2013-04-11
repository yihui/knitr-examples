knit:
	./knitall; \
	./k "078-chinese-big5.rnw', '078-chinese-big5.ctx', encoding='BIG5"; \
	./k "076-chinese-gb2312.rnw', encoding='GB2312"

pdf:
	ls *.tex | xargs -n1 -P4 texi2pdf -c -q

pandoc:
	Rscript 084-pandoc.R && Rscript 088-pandoc-embedded.R

deps:
	Rscript -e "for (i in c('ggplot2', 'mapproj', 'Hmisc', 'xtable', 'gridExtra', 'Rcpp', 'RcppArmadillo', 'diagram'))" \
	-e "if (!require(i, character.only=TRUE)) install.packages(i)"

clean:
	$(RM) *.log *.aux *.toc *.docx *.epub *.odt 084-pandoc-slides.html; \
	ls *.Rmd | sed 's/\.Rmd$$/.html/' | xargs $(RM); \
	find figure/ | grep -E 'figure/[a-zA-Z]' | xargs $(RM)

strip:
	for i in `ls | grep -E '^[0-9].*\.(brew|R(nw|md|tex|html|rst))$$'`; do sed -i "s/[[:space:]]*$$//" $$i; done

mount:
	sshfs yihui@r-forge.r-project.org:/srv/gforge/chroot/home/groups/animation/htdocs/knitr-ex ./r-forge

unmount:
	fusermount -u ./r-forge

sync:
	cp -u ./figure/*.png ./r-forge/figure/
