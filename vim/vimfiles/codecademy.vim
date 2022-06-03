let g:ccpyscript = 'python ' . g:vimfilesdir . 'scripts/codecademy_interface.py'

command! Codecademy call Codecademy()

function! Codecademy()
    silent! nunmap <buffer> <cr>
    silent! nunmap <buffer> <c-cr>
    silent! nunmap <buffer> <c-s-cr>
    nnoremap <buffer> <cr> mzgg"*yG`zzz:silent! call system(g:ccpyscript . ' to')<cr>
    nnoremap <buffer> <c-s-cr> mz"*yip`zzz:silent! call system(g:ccpyscript . ' to')<cr>
    nnoremap <buffer> <c-cr> zz:call system(g:ccpyscript . ' from')<cr>
    echo 'Codecademy ON'
endfunction
