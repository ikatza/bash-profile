$pdf_previewer = 'open -a Skim';
$pdflatex = 'lualatex -file-line-error -synctex=1 %O %S && ln -s %D %R.pdf';
$biber='biber --validate-datamodel %O %S';
$out_dir = 'auto';
$pdf_mode = 1;


## $pdf_previewer = 'open -a Skim';
## $pdflatex="xelatex -synctex=1 -interaction=nonstopmode %O %S";
## $out_dir = 'build';
## $pdf_mode = 5;
## #$pdflatex .= ' && cp -v %Z/%D %D';
## $pdflatex = 'xelatex %O %S && cp %D %R.pdf';
## $pdf_previewer = 'open -a Skim';
## #$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode';
## @generated_exts = (@generated_exts, 'synctex.gz');
