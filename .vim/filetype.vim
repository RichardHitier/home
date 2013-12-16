" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.raw		setfiletype raw
  au! BufRead,BufNewFile *.twiki	setfiletype twiki
  au! BufRead,BufNewFile *.pl	    setfiletype perl6
  au! BufRead,BufNewFile *.xhtml	setfiletype xml
augroup END

