knit:
	./knitall

pdf:
	ls | grep -E \.tex$$ | xargs texi2pdf -c -q

deps:
	Rscript -e "for (i in c('ggplot2', 'mapproj', 'Hmisc', 'xtable')) if (!require(i, character.only=TRUE)) install.packages(i)"

clean:
	$(RM) *.html *.pdf

