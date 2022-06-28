setlocal noexpandtab

" Add item by urgency
" Move to relevant section and add item
"   0   three MAX per day, high priority
"   1   must do: appointments, critical tasks, etc
"   2   want to do
"   3   never will do
nnoremap <buffer> <leader>0 gg/^0<cr>zzo0	<esc>A
nnoremap <buffer> <leader>1 gg/^1<cr>zzo1	<esc>A
nnoremap <buffer> <leader>2 gg/^2<cr>zzo2	<esc>A
nnoremap <buffer> <leader>3 gg/^3<cr>zzo3	<esc>A

" Mark item as done
" Move line to end of file then ad datetime
nmap <buffer> <leader>d "zddG"zpIdt;<tab>zz

" Move to start/end of TODO list
nnoremap <buffer> <leader>k 0"zyiw"xddgg/^z<cr>"xpkzz
nnoremap <buffer> <leader>j 0"zyiw"xdd/^\(z\)\@!<cr>"xPzz
nnoremap <buffer> <leader>x "zdd}k"zpzz


" DEPRECATED ------------------------------

function Deprecated()
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

" Move to later
nnoremap <buffer> <leader>l "zdd/# LATER<cr>"zpzz

" Sort current paragraph
nnoremap <buffer> <leader>s 0"zy50lvip:'<,'>sort<cr>{/z<cr>zz:set nohlsearch<cr>

" Randomize lines within location
nnoremap <buffer> <leader>r 0"zyiwgg/^z<cr>V/^\(z\)\@!<cr>k:ShuffleLines<cr>zz:set nohlsearch<cr>

" Add ID to item
setlocal iskeyword +=- " Treat 64-bit IDs as a word. IDs contain -, which vim by default treats as a word boundary.
nmap <buffer> <leader>id mz0wiid;	<esc>`z8l

" Use item to create information entry
nmap <buffer> <leader>n yyGkpIdt;<tab>2wC
endfunction
