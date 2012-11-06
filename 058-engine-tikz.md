
Description
-----------

The engine inserts the code into a latex-string-template, which is then processed by `pdflatex` -- and `convert` (if `dev` is not `pdf`). 

Sometimes you have to adjust the latex-string-template to load some required
latex-packages. By default, `.tikz2pdf.tex.st` will be available in the current
working directory after the first call to `knit`. 


Options
-------

You can pass some options to the engine by defining `engine.opts`. By default it is defined as: 

```r
engine.opts = list(
   ,repl.tmpl = ".tikz2pdf.tex.st" # Latex-string template file 
       ## The code is inserted into this file; if it is not existing it will be
       ## generated; depending on your purpose and language you have to define
       ## some latex-packages in there. 
    repl.st = "<>"  # String to replace in template-file
```

Example
-------

An example of the tikz-engine from <https://raw.github.com/sdiehl/cats/master/misc/example.md>

![Funky tikz](figure/tikz-ex.pdf) 


Tips
----

To develop the tikz-code, you could use `qtikz` or `ktikz`.
