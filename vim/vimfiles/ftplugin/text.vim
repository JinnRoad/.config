" Use color columns to control sentence length.
" Calculation
"   Assume 6 characters per word (including space or punctuation).
"   10 words -> 60 char
"   20 words -> 120 char
"   30 words -> 180 char
setlocal colorcolumn=61,121,181 " Mark nth column. Write to the (n-1)th column

" Add word count to status line
setlocal laststatus=2
