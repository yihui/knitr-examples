$file=$args[0]
$base=[System.IO.Path]::GetFileNameWithoutExtension($file)
# R expect /
$file=$file -replace '[\\/]','/'

$prefix=${base}+"-"

$AllArgs = @(
  "-e", "if (Sys.getenv('USER')=='yihui' || Sys.getenv('CI')=='true') knitr::opts_knit`$set(base.url='https://db.yihui.org/knitr-examples/')",
  "-e", "knitr::opts_chunk`$set(cache.path='cache/$prefix', fig.path='figure/$prefix', tidy=TRUE)",
  "-e", "set.seed(123); knitr::knit('$file', quiet = TRUE)"
  )

& "Rscript" $AllArgs

# if there is an extra argument, compile tex to pdf
If($args[1])
{
  & "texi2pdf" @("-c", "$base.tex")
}