" TODO update vim fix force vert ter

"set termwinkey=<c-e>
cnoremap vter<cr> vert ter<cr><c-w>J
let g:terminal_direction = 'vert ter'

" Force vertical terminal on startup
" Use command ForceVertTerm to return to horizontal terminal
"let s:force_vert_term = 0
"command! ForceVertTerm call ForceVertTerm()
"function! ForceVertTerm()
"    let s:force_vert_term = !s:force_vert_term
"    if s:force_vert_term
"        cnoremap ter<cr> vert ter<cr>
"    else
"        cunmap ter<cr>
"    endif
"endfunction
"call ForceVertTerm()

augroup terminalcommands
	autocmd!

    " Commands to run a file
    autocmd Filetype bqn	    let g:prefix = 'bqn'
    autocmd Filetype forth	    let g:prefix = 'gforth'
    autocmd Filetype mysql 	    let g:prefix = 'sqlite3 -init'
    autocmd Filetype python	    let g:prefix = 'python'
    autocmd Filetype sh 	    let g:prefix = 'bash'
    autocmd Filetype v		    let g:prefix = 'v run'
    autocmd Filetype vim	    let g:prefix = 'source'
    autocmd Filetype zig	    let g:prefix = 'zig run'

    autocmd Filetype bqn,forth,mysql,python,sh,v,zig let g:body = '%'
    autocmd Filetype vim	let g:body = g:vimfilesdir . 'vimrc'

	" Close terminals
	nnoremap <s-cr> :call CloseTerminals()<cr>
	tnoremap <s-cr> <c-e>:call CloseTerminals()<cr>

	" Run FILE
	autocmd Filetype mysql,python,sh nnoremap <buffer> <cr> :call Run(g:prefix, g:body, '')<cr>
	autocmd Filetype markdown nnoremap <buffer> <c-s-cr> :call MakePdf()<cr>
	autocmd Filetype vim nnoremap <buffer> <cr> :execute g:prefix g:body<cr>

    " The above <cr> binding for .vim files prevents pressing enter when using
    " the command window (q: ). This is because the above bindings will run
    " :source % on the command window.  The below command fixes this issue by
    " unmapping the <cr> binding for vim files.
    autocmd CmdWinEnter * nunmap <buffer> <cr>
au BufRead,BufNewFile,BufEnter *.cc.* set filetype=codecademy

augroup END

function! Run(prefix, body, suffix)
    w
	normal mz
	call CloseTerminals()
    let execution_string = join([g:terminal_direction, a:prefix, a:body, a:suffix], ' ')
    execute execution_string
    wincmd p
    normal `z
endfunction

function! CloseTerminals()
	let terminals = split(execute('filter/!/ls'), '\n')
	if !len(terminals)
		return
	else
		for i in range(len(terminals))
			silent! execute "bw!" split(terminals[i], ' ')[0]
		endfor
	endif
endfunction

function! MakePdf()
    "autocmd Filetype markdown	let g:prefix = 'pandoc'
    "autocmd Filetype markdown let g:body = '% -s -o pdfs/' . expand('%:t:r') . '.pdf'
    w
    let md = expand('%')
    let pdf = 'pdfs/'.expand('%:t:r').'.pdf'
    let cmd = 'pandoc ' . md . ' -s -o ' .  pdf . ' &'
    call system(cmd)
    redraw!
endfunction
