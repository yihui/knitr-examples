#!/bin/bash

echo "$0" "$*" >> /dev/stderr

prefix=${1%.*}-
time Rscript -e "options(digits=4,warnPartialMatchAttr=FALSE,warnPartialMatchDollar=FALSE)"\
 -e "if (Sys.getenv('USER')=='yihui' || Sys.getenv('TRAVIS')=='true') knitr::opts_knit\$set(base.url='http://db.yihui.name/knitr-examples/')"\
 -e "if (Sys.getenv('USER')=='yihui') knitr::opts_knit\$set(base.dir='~/Dropbox/Public/knitr-examples/')"\
 -e "knitr::opts_chunk\$set(cache.path='cache/$prefix', fig.path='figure/$prefix', tidy=TRUE)"\
 -e "set.seed(123); knitr::knit('$1', quiet = TRUE)"

# if there is an extra argument, compile tex to pdf
if [ "$2" != '' ]; then
  texi2pdf -c ${1%.*}.tex
fi
