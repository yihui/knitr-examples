# Run perl scripts


```r
# should exist
Sys.which("perl")
```

```
##            perl 
## "/usr/bin/perl"
```


Does `perl` work?


```perl
$test = "jello world";
$test =~ s/j/h/;
print $test
```

```
## hello world
```

