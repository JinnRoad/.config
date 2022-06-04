" Save settings
set autoread  " Update files when they change
set autowrite  " Autosave
set autowriteall  " Autosave on buffer switch
set nobackup " Keep backup files
set noswapfile " Don't use swap files
set undofile  " Create undo file
set viewoptions=folds,cursor " Limit what is saved by mkview

" Save automatically
augroup autosave
	autocmd!
	autocmd FocusLost	* silent! wa
	autocmd BufLeave	* silent! wa
augroup END

" Save directory for undo, swap, backup, views, sessions, viminfo
" Viminfo: Comma separated values
execute "set backupdir="	            . g:docsdir . 'backup/vim/backup//'
execute "set directory="	            . g:docsdir . 'backup/vim/swap//'
execute "set undodir="		            . g:docsdir . 'backup/vim/undo//'
execute "set viewdir="		            . g:docsdir . 'backup/vim/view//'
execute "set viminfo+='50,<20,%5,c,n"	. g:docsdir . 'backup/vim/_viminfo'

" '50,<20,%5,c,n
" #file marks, #lines of register, #buffers, convert encoding, name

" Strip trailing whitespace automatically
function! StripTrailingWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction
augroup stripwhitespace
	autocmd!
	autocmd BufEnter	* silent! :call StripTrailingWhitespace()
	autocmd BufWritePre	* silent! :call StripTrailingWhitespace()
augroup END
