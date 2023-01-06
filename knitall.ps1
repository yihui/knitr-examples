
Get-ChildItem -Path "[0-9]*" |
  Where-Object {$_.Extension -match "\.(brew|R(nw|md|tex|html|rst|asciidoc|textile))"} |
  Where-Object {$_.Basename -notmatch "^051-"} |
  ForEach-Object { ./k.ps1 $_ }

# special qmd tests
Rscript -e "knitr::convert_chunk_header('094-purl.Rmd', '094-purl.qmd', 'yaml');"
Rscript -e "knitr::knit('094-purl.qmd', output = '094-purl-qmd.md'); knitr::purl('094-purl.qmd', output = '094-purl-qmd.R')"
mv 078-chinese-big5.tex 078-chinese-big5.ctx
# Explicitly run caching test twice
./k.ps1 "101-cache-levels.Rmd"
# load_cache() requires running twice
./k.ps1 "114-load-cache.Rmd"
