" Change the way vim displays fold text

" Default
" +--  4 lines: LineTextTruncated-----------------

" Desired: round to nearest 10 or 100
" LineTextTruncated                ~10 -----------

function! FoldText()
    let linecount = v:foldend - v:foldstart + 1
    let linetext = getline(v:foldstart)
	let lineabbrev = linetext[:63]
	let spacer = repeat('-', 72 - len(lineabbrev)) . ' '
	let extends = linetext == lineabbrev ? '  ' : '… '
	let round_val = linecount < 100 ? 10.0 : 100.0
	let approx = '~' . float2nr(round(linecount / round_val) * round_val)
	" Remove three-digit spacing between tilde and approx line count.
    let txt = lineabbrev . extends . spacer . printf('%5S', approx)
    return txt
endfunction
set foldtext=FoldText()

" preserve folds between sessions
augroup remember_folds
    autocmd!
    autocmd BufWinLeave,BufWrite * silent! mkview
    autocmd BufWinEnter * silent! loadview
augroup END
