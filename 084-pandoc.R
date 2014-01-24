library(knitr)
# this feature comes in v1.2
stopifnot(packageVersion('knitr') > '1.1')

knit('084-pandoc.Rmd')

# HTML output
pandoc('084-pandoc.md', format = 'html')

# there are sections of arguments specified in 084-pandoc.pandoc, e.g. dzslides,
# but note that the output name is 084-pandoc-slides.html, and the default name
# would be 084-pandoc.html
pandoc('084-pandoc.md', format = 'dzslides')

# it is also possible to convert md to pdf through xelatex
pandoc('084-pandoc.md', format = 'latex')
# the default latex engine is pdflatex; to use pdflatex, just remove
# `latex-engine: xelatex` from the configuration file

# convert to beamer slides
pandoc('084-pandoc.md', format = 'beamer')

# the configuration file 084-pandoc.pandoc did not specify other formats such as
# docx or odt, epub, etc, and pandoc() will only pass the common settings in the
# first section of the configuration file
pandoc('084-pandoc.md', format = 'docx')
pandoc('084-pandoc.md', format = 'odt')
pandoc('084-pandoc.md', format = 'epub')

# you might have noticed that the plot looks blurred in LaTeX/PDF output and
# that is because R Markdown uses the png() device by default; we can certainly
# use pdf()
if (FALSE) {
  opts_chunk$set(dev = 'pdf')
  knit('084-pandoc.Rmd')
  # now it should be better
  pandoc('084-pandoc.md', format = 'latex')
}
