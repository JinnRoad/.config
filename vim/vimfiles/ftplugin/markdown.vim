setlocal noexpandtab

" Use color columns to control sentence length.
" Calculation
"   Assume 6 characters per word (including space or punctuation).
"   10 words -> 60 char
"   20 words -> 120 char
"   30 words -> 180 char
setlocal colorcolumn=61,121,181 " Mark nth column. Write to the (n-1)th column

nnoremap <buffer> <c-j> "zyy"zpf<tab>lC
nnoremap <buffer> <c-k> o<tab>1.<tab>

" Add word count to status line
setlocal laststatus=2

setlocal statusline =%1*\ %f\                       " Filename
setlocal statusline+=%2*\ %{strftime('%H:%M')}\     " Datetime
setlocal statusline+=%3*%h%r                        " Flags
setlocal statusline+=%9*\ %=\                       " Alignment split
setlocal statusline+=%2*\ WC:%{WordCount()}\        " Word count
setlocal statusline+=%4*\ %l,%v\                    " Row,Col
setlocal statusline+=%5*\ (%p%%)                    " Document percentage
