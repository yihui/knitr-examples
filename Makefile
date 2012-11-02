knit:
	./knitall

pdf:
	ls *.tex | xargs texi2pdf -c -q

deps:
	Rscript -e "for (i in c('ggplot2', 'mapproj', 'Hmisc', 'xtable', 'gridExtra', 'Rcpp', 'RcppArmadillo')) if (!require(i, character.only=TRUE)) install.packages(i)"

clean:
	$(RM) *.log; \
	ls *.Rmd | sed 's/\.Rmd$$/.html/' | xargs $(RM)

