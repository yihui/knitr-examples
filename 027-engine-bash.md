# Run bash scripts


```r
# should exist
Sys.which("bash")
```

```
##        bash 
## "/bin/bash"
```

```r
Sys.which("sh")
```

```
##        sh 
## "/bin/sh"
```


Does `bash` work?


```bash
echo hello world
echo 'a b c' | sed 's/ /\|/g'
# number of lines
awk 'END{print NR;}' 027-engine-bash.Rmd
```

```
## hello world
## a|b|c
## 23
```


How about `sh`?


```sh
# run wc on all engine examples
ls | grep engine | xargs wc
```

```
##   108   208  1423 023-engine-python.md
##    65   165  1292 023-engine-python.Rmd
##    17    38   162 024-engine-awk.md
##    11    41   252 024-engine-awk.Rmd
##    13    21   128 025-engine-ruby.md
##     7    17   109 025-engine-ruby.Rmd
##    14    37   235 026-engine-haskell.md
##     8    37   267 026-engine-haskell.Rmd
##    76   204  1457 027-engine-bash.md
##    23    58   352 027-engine-bash.Rmd
##    27    35   222 028-engine-perl.md
##    14    26   172 028-engine-perl.Rmd
##   129   354  2645 029-engine-Rcpp.md
##    97   345  2685 029-engine-Rcpp.Rmd
##    23    56   528 057-engine-dot.md
##    18    62   474 057-engine-dot.Rmd
##    40   183  1371 058-engine-tikz.md
##    35   193  1346 058-engine-tikz.Rmd
##    15    67   425 060-engine-sas.md
##    13    72   537 060-engine-sas.Rmd
##    64   136  1043 080-engine-coffeescript.md
##    29    98   877 080-engine-coffeescript.Rmd
##    45    60   336 090-engine-c.md
##    21    41   256 090-engine-c.Rmd
##   912  2554 18594 total
```

