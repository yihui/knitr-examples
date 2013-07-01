library(knitr)
# this feature comes in v1.2
stopifnot(packageVersion('knitr') > '1.1')

# configurations are embedded in the input file
knit('088-pandoc-embedded.Rmd')

# default is HTML output
pandoc('088-pandoc-embedded.md')

# it is also possible to convert md to pdf through xelatex
pandoc('088-pandoc-embedded.md', format = 'latex')

# multiple output formats
pandoc('088-pandoc-embedded.md', format = c('latex', 'html', 'odt'))
