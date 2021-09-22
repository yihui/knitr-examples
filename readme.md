# knitr examples

This repository is a collection of [**knitr**](http://yihui.org/knitr/) examples. It is both for my own test purpose and for other knitters to learn about this package.

For each input file, there is an output file, e.g. `001-minimal.Rmd` corresponds to `001-minimal.md`.

## Integration tests

This repository is used to test **knitr** package. A special workflow inside Github Action in the **knitr** repo will checkout this repository and run the integration test again the dev version of knitr. The CI is triggered the following way: 

* When a push is made on main branch into **knitr** repository, the main branch of this repository will be retrieve
* On PR to **knitr**, the head branch name of the PR will be retrieve and it will be checked if a branch with the same name exists in this repository. If so, then the specific branch will be the one used for the integration tests. Otherwise, the main branch will be used. This means that when a PR is opened on **knitr**, there could be often a companion PR inside this repository to adapt the test suites.

### Limitations

When a PR is made from a fork, the integration will be run against the main branch. The workflow is yet to be improve to retrieve a specific external PR from this repo that is associated with a PR in **knitr** repo.

### Resources

- [knitr-examples.yaml](https://github.com/yihui/knitr/blob/master/.github/workflows/knitr-examples.yaml): GHA workflow file in **knitr**
- [checkout-knitr-examples](https://github.com/yihui/knitr/blob/master/.github/actions/checkout-knitr-examples/action.yml): Special action to retrieve the correct branch
