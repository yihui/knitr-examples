# Run bash scripts


```r
# should exist
Sys.which("bash")
```

```
##            bash 
## "/bin/bash"
```

```r
Sys.which("sh")
```

```
##            sh 
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
wc 027-engine-bash.Rmd
```

```
##  23  53 347 027-engine-bash.Rmd
```
