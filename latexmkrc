## configuration for latexmk utility

# kind of preview file to use
# default: highest generated file (pdf, ps or dvi)
$view = "default";

# dvi previewer command
$dvi_previewer = "start xdvi %O %S";
# method used to update a changed dvi file
# 0: automatic, 1: manual, 2: update signal,
# 3: no update, 4: custom command
$dvi_update_method = 2;
#$dvi_update_signal = SIGUSR1; # works for xdvi
#$dvi_update_command = "";

# ps previewer command
$ps_previewer = "start gv %O %S";
$ps_previewer_landscape = "start gv -swap %O %S";
# method used to update a changed ps file
# 0: automatic, 1: manual, 2: update signal,
# 3: no update, 4: custom command
$ps_update_method = 0;
#$ps_update_signal = SIGHUP; # works with gv
#$ps_update_command = "";

# pdf previewer command
#$pdf_previewer = "start evince %O %S";
$pdf_previewer = "start zathura %O %S";
# method used to update a changed pdf file
# 0: automatic, 1: manual, 2: update signal,
# 3: no update, 4: custom command
$pdf_update_method = 0;
#$pdf_update_signal = SIGHUP; # works with gv
#$pdf_update_command = "";


# dvi generation mode
#$dvi_mode = 0;
# postscript generation mode
#$postscript_mode = 0;
# pdf generation mode
# 0: no pdf, 1: use pdflatex, 2: generate pdf from ps file (ps2pdf),
# 3: generate pdf from dvi file (dvipdf)
$pdf_mode = 1;

# run the previewer after the run
$preview_mode = 0;
# automatically run latexmk to keep the preview up-to-date
$preview_continuous_mode = 0;


# latex and pdflatex commands to execute
$latex = "latex %O %S";
$pdflatex = "pdflatex %O %S";
# make command to execute
$make = "make";
# index processing command to execute
$makeindex = "makeindex %O -o %D %S";
#$makeindex = "texindy %O -o %D %S";
# biber command to execute
$biber = "biber %O %S";
# bibtex command to execute
$bibtex = "bibtex %O %S";
# when to run biber or bibtex
# 0: never, 1: only if the bib file exists, 2: always
$bibtex_use = 1;

# dvi-to-pdf conversion command
#$dvipdf = "dvipdf %O %S %D";
$dvipdf = "dvipdfmx %O -o %D %S";
# dvi-to-ps conversion command
$dvips = "dvips %O -o %D %S";
$dvips_landscape = "dvips -tlandscape %O -o %D %S";
$dvips_pdf_switch = "-P pdf";
# ps-to-pdf conversion command
$ps2pdf = "ps2pdf %O %S %D";


# list of files to be processed
# can be customized and included in a local latexmkrc (working folder)
@default_files = ("*.tex");

# also cleanup files generated by custom dependencies
$cleanup_includes_cusdep_generated = 0;
# also cleanup generated files listed in the log file
$cleanup_includes_generated = 0;
# extra extensions of files to clean
$clean_ext = "dvi run.xml pre %R.ist %R.xdy tdo";
$clean_full_ext = "";

# display a list of dependencies after a run
$dependents_list = 0;

# use the file generated by the recorder option of latex to
# improve detection of generated files
$recorder = 1;


# to automatically make glossaries
#sub makeglossaries {
    #if ( $silent ) { system( "makeglossaries -q '$_[0]'" ); }
    #else { system( "makeglossaries '$_[0]'" ); };
#}
#add_cus_dep( "glo", "gls", 0, "makeglossaries" );
#add_cus_dep( "acn", "acr", 0, "makeglossaries" );
#push @generated_exts, "glo", "gls", "glg";
#push @generated_exts, "acn", "acr", "alg";

# to automatically compile Asymptote files
#sub asy {
    #system( "asy '$_[0]'" );
#}
#add_cus_dep( "asy", "eps", 0, "asy" );
#add_cus_dep( "asy", "pdf", 0, "asy" );
#add_cus_dep( "asy", "tex", 0, "asy" );

