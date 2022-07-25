
Get-ChildItem -Path "[0-9]*" |
  Where-Object {$_.Extension -match "\.(brew|R(nw|md|tex|html|rst|asciidoc|textile))"} |
  Where-Object {$_.Basename -notmatch "^051-"} |
  ForEach-Object { ./k.ps1 $_ }

Rscript -e "knitr::purl('094-purl.Rmd')"
mv 078-chinese-big5.tex 078-chinese-big5.ctx
# Explicitly run caching test twice
./k.ps1 "101-cache-levels.Rmd"
# load_cache() requires running twice
./k.ps1 "114-load-cache.Rmd"
