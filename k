#!/bin/bash

prefix=${1%.*}-
time Rscript -e "options(digits=4)"\
 -e "knitr::opts_knit\$set(base.url='http://animation.r-forge.r-project.org/knitr-ex/')"\
 -e "knitr::opts_chunk\$set(cache.path='cache/$prefix', fig.path='figure/$prefix', tidy=TRUE)"\
 -e "set.seed(123); knitr::knit('$1', quiet = TRUE)"

# if there is an extra argument, compile tex to pdf
if [ "$2" != '' ]; then
  texi2pdf -c ${1%.*}.tex
fi
