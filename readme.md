# knitr examples

This repository is a collection of [knitr](http://yihui.name/knitr) examples. It is both for my own test purpose and for other knitters to learn about this package.

For each input file, there is an output file, e.g. `001-minimal.Rmd` corresponds to `001-minimal.md`.

## Integration tests

By [enabling Travis CI](https://travis-ci.org/profile) for your `knitr` fork, a series of tests is run for each pushed revision.  If you have a branch (even `master`) in your `knitr` fork and a branch with the same name in your `knitr-examples` fork, each push to `knitr` will trigger an *integration test* that checks all examples in the corresponding branch of `knitr-examples` and reports if any unexpected differences are found.  Use this for major changes to `knitr` to avoid undesired side effects.
