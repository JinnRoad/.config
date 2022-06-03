setlocal noexpandtab

" Add to do item
" current errand work home
nnoremap <buffer> <leader>c gg/^curr<cr>zzOcurr	<esc>A
nnoremap <buffer> <leader>e gg/^erra<cr>zzOerra	<esc>A
nnoremap <buffer> <leader>h gg/^home<cr>zzOhome	<esc>A
nnoremap <buffer> <leader>w gg/^work<cr>zzOwork	<esc>A

" Go to category
nnoremap <buffer> <leader>C gg/^curr<cr>zz
nnoremap <buffer> <leader>E gg/^erra<cr>zz
nnoremap <buffer> <leader>H gg/^home<cr>zz
nnoremap <buffer> <leader>W gg/^work<cr>zz

" Move to start/end of TODO list
nnoremap <buffer> <leader>k 0"zyiw"xddgg/^z<cr>"xPzz
nnoremap <buffer> <leader>j 0"zyiw"xdd/^\(z\)\@!<cr>"xPzz
nnoremap <buffer> <leader>x "zdd}k"zpzz

" Move to later
nnoremap <buffer> <leader>l "zdd/# LATER<cr>"zpzz

" Mark item as done
nmap <buffer> <leader>d "zddGk"zpIdt;<tab>zz

" Sort current paragraph
nnoremap <buffer> <leader>s 0"zy50lvip:'<,'>sort<cr>{/z<cr>zz:set nohlsearch<cr>

" Randomize lines within location
nnoremap <buffer> <leader>r 0"zyiwgg/^z<cr>V/^\(z\)\@!<cr>k:ShuffleLines<cr>zz:set nohlsearch<cr>

" Add ID to item
setlocal iskeyword +=- " Treat 64-bit IDs as a word. IDs contain -, which vim by default treats as a word boundary.
nmap <buffer> <leader>id mz0wiid;	<esc>`z8l

" Use item to create information entry
nmap <buffer> <leader>n yyGkpIdt;<tab>2wC
