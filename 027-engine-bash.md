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
 106  192 1406 023-engine-python.md
  59  150 1240 023-engine-python.Rmd
  21   42  240 024-engine-awk.md
  12   41  237 024-engine-awk.Rmd
  16   25  206 025-engine-ruby.md
   7   17  109 025-engine-ruby.Rmd
  15   22  184 026-engine-haskell.md
   6   17  116 026-engine-haskell.Rmd
  65  125  890 027-engine-bash.md
  23   58  352 027-engine-bash.Rmd
 330  689 4980 total
```


See https://github.com/yihui/knitr-examples/027-engine-bash.md for the output.

