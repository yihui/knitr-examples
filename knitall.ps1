
Get-ChildItem -Path "[0-9]*" |
  Where-Object {$_.Extension -match "\.(brew|R(nw|md|tex|html|rst|asciidoc|textile))"} |
  Where-Object {$_.Basename -notmatch "^051-" -and $_.Basename -notmatch "^126-"} |
  ForEach-Object { ./k.ps1 $_ }

# special qmd tests
Rscript -e "knitr::convert_chunk_header('094-purl.Rmd', '094-purl.qmd', 'yaml');"
Rscript -e "knitr::knit('094-purl.qmd', output = '094-purl-qmd.md'); knitr::purl('094-purl.qmd', output = '094-purl-qmd.R')"
mv 078-chinese-big5.tex 078-chinese-big5.ctx
# Explicitly run caching test twice
./k.ps1 "101-cache-levels.Rmd"
# load_cache() requires running twice
./k.ps1 "114-load-cache.Rmd"

## ---
## special error test: we want to capture the error message
Rscript -e "evaluate::local_reproducible_output(); knitr::knit('126-error-backtrace.Rmd', quiet = TRUE)" > 126-error-backtrace.txt 2>&1
Rscript -e "evaluate::local_reproducible_output(); knitr::knit('126-error-backtrace-2.Rmd', quiet = TRUE)" > 126-error-backtrace-2.txt 2>&1

$env:_R_CHECK_LICENSE_="true"
Rscript -e "evaluate::local_reproducible_output(); knitr::knit('126-error-backtrace.Rmd', quiet = TRUE)" > 126-error-backtrace-rcmd.txt 2>&1
Rscript -e "evaluate::local_reproducible_output(); knitr::knit('126-error-backtrace-2.Rmd', quiet = TRUE)" > 126-error-backtrace-2-rcmd.txt 2>&1
$env:_R_CHECK_LICENSE_=$null

Remove-Item @('126-error-backtrace.md', '126-error-backtrace-2.md') -ErrorAction SilentlyContinue
## ----