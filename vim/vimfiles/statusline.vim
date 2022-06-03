set statusline =%1*\ %f\                                " Filename
set statusline+=%2*\ %{strftime('%H:%M')}\              " Datetime
set statusline+=%3*%h%r                                 " Flags
set statusline+=%9*\ %=\                                " Alignment split
set statusline+=%4*\ %l,%v\                             " Row,Col
set statusline+=%5*\ (%p%%)                             " Document percentage

hi User1 ctermfg=0 ctermbg=2
hi User2 ctermfg=0 ctermbg=3
hi User3 ctermfg=0 ctermbg=4
hi User4 ctermfg=0 ctermbg=6
hi User5 ctermfg=0 ctermbg=7
hi User9 ctermfg=0 ctermbg=8

hi StatusLine       ctermfg=0 ctermbg=8
hi StatusLineNC     ctermfg=0 ctermbg=8 cterm=none
