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
 108  201 1402 023-engine-python.md
  65  165 1292 023-engine-python.Rmd
  18   37  160 024-engine-awk.md
  12   41  237 024-engine-awk.Rmd
  13   20  125 025-engine-ruby.md
   7   17  109 025-engine-ruby.Rmd
  12   17  100 026-engine-haskell.md
   6   17  116 026-engine-haskell.Rmd
  62  120  809 027-engine-bash.md
  23   58  352 027-engine-bash.Rmd
 326  693 4702 total
```

