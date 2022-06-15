setlocal noexpandtab

" Use color columns to control sentence length.
" Calculation
"   Assume 6 characters per word (including space or punctuation).
"   10 words -> 60 char
"   20 words -> 120 char
"   30 words -> 180 char
setlocal colorcolumn=61,121,181 " Mark nth column. Write to the (n-1)th column

" Insert list item
nnoremap <buffer> <space>j "zyy"zpf<tab>lC
" Insert list subitem
nnoremap <buffer> <space>k o<tab>1.<tab>

" Open pdf, assuming its in ./pdfs/

nnoremap <buffer> gF :call system('mupdf pdfs/' . expand('%:r') . '.pdf &')<cr>

" Add word count to status line
setlocal laststatus=2

nnoremap <buffer> [s [s1z=
setlocal spell
