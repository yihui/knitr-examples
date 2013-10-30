#!/bin/bash

echo "$0" "$*" >> /dev/stderr

prefix=${1%.*}-
time R --vanilla <<END_R
library(knitr)
opts_knit\$set(base.url='http://animation.r-forge.r-project.org/knitr-ex/')
opts_chunk\$set(cache.path='cache/$prefix', fig.path='figure/$prefix')
set.seed(123); knit('$1', quiet = TRUE)
END_R

# if there is an extra argument, compile tex to pdf
if [ "$2" != '' ]; then
  texi2pdf -c ${1%.*}.tex
fi
