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
hello world
a|b|c
23
```


How about `sh`?


```sh
# run wc on all engine examples
ls | grep engine | xargs wc
```

```
  108   201  1402 023-engine-python.md
   65   165  1292 023-engine-python.Rmd
   17    37   159 024-engine-awk.md
   11    41   252 024-engine-awk.Rmd
   13    20   125 025-engine-ruby.md
    7    17   109 025-engine-ruby.Rmd
   14    36   232 026-engine-haskell.md
    8    37   267 026-engine-haskell.Rmd
   70   152  1140 027-engine-bash.md
   23    58   352 027-engine-bash.Rmd
   27    34   219 028-engine-perl.md
   14    26   172 028-engine-perl.Rmd
  128   402  2999 029-engine-Rcpp.md
   95   392  3035 029-engine-Rcpp.Rmd
   23    56   528 057-engine-dot.md
   18    62   474 057-engine-dot.Rmd
   40   183  1371 058-engine-tikz.md
   35   193  1346 058-engine-tikz.Rmd
  716  2112 15474 total
```

