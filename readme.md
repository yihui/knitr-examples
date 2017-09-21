# knitr examples

This repository is a collection of [knitr](http://yihui.name/knitr) examples. It is both for my own test purpose and for other knitters to learn about this package.

For each input file, there is an output file, e.g. `001-minimal.Rmd` corresponds to `001-minimal.md`.

## Integration tests

The examples can be checked automatically with [Travis CI](https://travis-ci.org). To enable:

- Fork this repository and [`knitr`](https://github.com/yihui/knitr)
- [Enable Travis CI](https://travis-ci.org/profile) for your `knitr`fork
- In your `knitr` fork, create a branch *with the same name* as in your `knitr-examples` fork
    - You can also choose to work in `master` in both repositories

Now, each time you push to `knitr`, the examples are compiled and checked for differences with the expected result.  Use this for major changes to `knitr` to avoid undesired side effects.
