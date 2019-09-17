#!/bin/bash

echo "$0" "$*" >> /dev/stderr

prefix=${1%.*}-
Rscript \
 -e "if (Sys.getenv('USER')=='yihui' || Sys.getenv('TRAVIS')=='true') knitr::opts_knit\$set(base.url='http://db.yihui.name/knitr-examples/')"\
 -e "knitr::opts_chunk\$set(cache.path='cache/$prefix', fig.path='figure/$prefix', tidy=TRUE)"\
 -e "set.seed(123); knitr::knit('$1', quiet = TRUE)"

# if there is an extra argument, compile tex to pdf
if [ "$2" != '' ]; then
  texi2pdf -c ${1%.*}.tex
fi
