setlocal noexpandtab

" Add item by urgency
" Move to relevant section and add item
"   0   main projects (5 max)
"   1   must do today (3 max)
"   2   essential: appointments, critical tasks, etc
"   3   want to do
"   4   less important
nnoremap <buffer> <leader>0 gg/^0<cr>zzo0	<esc>A
nnoremap <buffer> <leader>1 gg/^1<cr>zzo1	<esc>A
nnoremap <buffer> <leader>2 gg/^2<cr>zzo2	<esc>A
nnoremap <buffer> <leader>3 gg/^3<cr>zzo3	<esc>A
nnoremap <buffer> <leader>4 gg/^4<cr>zzo4	<esc>A

" Mark item as done
" Move line to end of file then ad datetime
nmap <buffer> <leader>d "zddG"zpIdt;<tab>zz

" Move to start/end of TODO list
nnoremap <buffer> <leader>k 0"zyiw"xddgg/^z<cr>"xpkzz
nnoremap <buffer> <leader>j 0"zyiw"xdd/^\(z\)\@!<cr>"xPzz
nnoremap <buffer> <leader>x "zdd}k"zpzz

" Sort current paragraph
" Copy after current position in line
" Copy the line
" Sort the paragraph
" Find the original line
nnoremap <buffer> <leader>s "zy$0"xy$vip:'<,'>sort<cr>{/z<cr>/ix<cr>zz:set nohlsearch<cr>


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

" Randomize lines within location
nnoremap <buffer> <leader>r 0"zyiwgg/^z<cr>V/^\(z\)\@!<cr>k:ShuffleLines<cr>zz:set nohlsearch<cr>

" Add ID to item
setlocal iskeyword +=- " Treat 64-bit IDs as a word. IDs contain -, which vim by default treats as a word boundary.
nmap <buffer> <leader>id mz0wiid;	<esc>`z8l

" Use item to create information entry
nmap <buffer> <leader>n yyGkpIdt;<tab>2wC
endfunction
