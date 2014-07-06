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
##    98   199  1422 023-engine-python.md
##    65   162  1295 023-engine-python.Rmd
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
##    97   345  2685 029-engine-Rcpp.Rmd
##    22    56   527 057-engine-dot.md
##    18    63   486 057-engine-dot.Rmd
##    39   183  1370 058-engine-tikz.md
##    35   193  1346 058-engine-tikz.Rmd
##    14    67   425 060-engine-sas.md
##    13    72   538 060-engine-sas.Rmd
##    59   136  1038 080-engine-coffeescript.md
##    31   105   937 080-engine-coffeescript.Rmd
##    42    60   333 090-engine-c.md
##    21    41   256 090-engine-c.Rmd
##    38    86   568 111-engine-fortran.md
##    31    65   521 111-engine-fortran.Rmd
##   950  2711 19821 total
```
