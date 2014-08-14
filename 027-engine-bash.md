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
##    99   200  1437 023-engine-python.md
##    66   163  1310 023-engine-python.Rmd
##    16    38   161 024-engine-awk.md
##    11    41   252 024-engine-awk.Rmd
##    12    21   127 025-engine-ruby.md
##     7    17   109 025-engine-ruby.Rmd
##    13    37   234 026-engine-haskell.md
##     8    37   267 026-engine-haskell.Rmd
##    75   214  1541 027-engine-bash.md
##    23    58   352 027-engine-bash.Rmd
##    25    35   220 028-engine-perl.md
##    14    26   172 028-engine-perl.Rmd
##   123   354  2639 029-engine-Rcpp.md
##    98   346  2700 029-engine-Rcpp.Rmd
##    22    56   527 057-engine-dot.md
##    18    63   486 057-engine-dot.Rmd
##    39   183  1370 058-engine-tikz.md
##    35   193  1346 058-engine-tikz.Rmd
##    14    67   425 060-engine-sas.md
##    13    72   538 060-engine-sas.Rmd
##    71   216  1481 080-engine-coffeescript.md
##    42   191  1447 080-engine-coffeescript.Rmd
##    42    60   333 090-engine-c.md
##    21    41   256 090-engine-c.Rmd
##    36    78   499 111-engine-fortran.md
##    31    65   507 111-engine-fortran.Rmd
##   974  2872 20736 total
```
