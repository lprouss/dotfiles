"" Mutt
augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-* setfiletype mail
augroup END

"" Asymptote support
augroup filetypedetect
    au BufNewFile,BufRead *.asy setf asy
augroup END

