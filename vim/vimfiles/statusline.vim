set statusline=%1*                                  " Empty
set statusline+=%2*\ %{strftime('%m-%d\ %H:%M')}\   " Datetime
set statusline+=%3*\ %l,%v\                         " Row,Col
set statusline+=%2*\ %p%%\                          " Document percentage
set statusline+=%2*%r                               " Flags
set statusline+=%1*\ %f\                            " Filename
set statusline+=%9*\ %=\                            " Alignment split

hi User1 ctermfg=0 ctermbg=2
hi User2 ctermfg=0 ctermbg=3
hi User3 ctermfg=0 ctermbg=4
hi User4 ctermfg=0 ctermbg=6
hi User5 ctermfg=0 ctermbg=7
hi User9 ctermfg=0 ctermbg=8

hi StatusLine       ctermfg=0 ctermbg=8
hi StatusLineNC     ctermfg=0 ctermbg=8 cterm=none

augroup remember_folds
    autocmd!
    autocmd FileType markdown,text silent! call StatusLineWC()
augroup END

function! StatusLineWC()
    setlocal statusline=%1*                                 " Empty
    setlocal statusline+=%3*\ WC\ %{WordCount()}\           " Word count
    setlocal statusline+=%2*\ %{strftime('%m-%d\ %H:%M')}\  " Datetime
    setlocal statusline+=%4*\ %l,%v\                        " Row,Col
    setlocal statusline+=%5*\ (%p%%)\                       " Document percentage
    setlocal statusline+=%3*%r                              " Flags
    setlocal statusline+=%1*\ %f\                           " Filename
    setlocal statusline+=%9*\ %=\                           " Alignment split
endfunction
