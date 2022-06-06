" Open file under cursor, even if it doesn't exist
" If it's a pdf, use <pdf_reader> to open it
let s:pdf_reader = 'mupdf'
nnoremap gf :call GoToFile()<cr>
function! GoToFile()
    if expand('<cfile>:e') == 'pdf'
        silent execute '!' . s:pdf_reader expand('<cfile>') '&'
    elseif expand('<cfile>')[:3] == 'http'
        !start chrome --incognito <cfile> &
    else
        silent execute 'e' expand('<cfile>')
    endif
    redraw!
endfunction

" Redraw
nnoremap <c-L> :redraw!<cr>

" Keep search match in mid window
nnoremap n nzz
nnoremap N Nzz

" Rerun last macro (Q by default enters Ex mode, which I don't use.)
nnoremap Q @@

" Add jk/kj movements larger than 1 to jump list.
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'

" Sets and clears search highlighting
nnoremap <bs>   :set hlsearch!<cr>
nnoremap *      :set hlsearch<cr>*
nnoremap /      :set hlsearch<cr>/
nnoremap ?      :set hlsearch<cr>?

" Make Y act like C and D, which I prefer.
" Reason for inconsitency: https://vi.stackexchange.com/a/6135
nnoremap Y y$

" Switch delimiters
nnoremap <leader>( mz%%r)r(`z
nnoremap <leader>[ mz%%r]r[`z
nnoremap <leader>{ mz%%r}r{`z
nnoremap <leader>' :call SwitchQuotes()<cr>
nnoremap <leader>" :call SwitchQuotes()<cr>
function! SwitchQuotes()
    normal mz
    if search('"', '', line('.'))
        "silent! normal! f"
        "silent! normal! r',r'
        s/"/'
    elseif search("'", '', line('.'))
        s/'/"
        "silent! normal! f'r",r"
    endif
    normal `z
endfunction

" Remove function f(x, y) -> x
nnoremap <leader>f f("_db"_xmzf,"_df)`z
nnoremap <leader>F %mx%"_db"_xmz`x"_x`z

" Copy buffer
nnoremap yi% mzgg"*yG`z

" Replace buffer with clipboard
nnoremap di% gg"_dG"*PG

" Create new undo entry on newline
inoremap <cr> <cr><c-g>u

" Datetime
"   command     Human-readable
"   commandd    Dense version

" Datetime
inoremap <expr> dt; strftime('%Y-%m-%d %H:%M')
noremap! <expr> dtd; strftime('%Y%m%d%H%M')

" Date
noremap! <expr> da; strftime('%Y-%m-%d')
noremap! <expr> dad; strftime('%Y%m%d')

" Time
noremap! <expr> ti; strftime('%H:%M')

" Datetime uuid approximate
"noremap! <expr> id; strftime('%Y%m%d%H%M%S')

" Base 64 uuid approximate from datetime
" Mostly used in insert mode
inoremap id; <c-r>=GetID()<cr><esc>yiwea
function! GetID()
    return system('python ' . '~/.config/vim/vimfiles/scripts/to64.py ' .  strftime('%Y%m%d%H%M%S'))
endfunction

" Add TODO to -import
let g:todofile = '~/docs/current/todo/todo.todo'
command! AddToDo call AddToDo()
function! AddToDo()
	" Copy current filepath
    let @x = expand('%:p')
    " Copy to do item from line: # TODO to do item
    normal! 0"zy$
    " Open new tab to to do list file
    execute 'tabe' g:todofile
    " Append to do item
    normal /# To doo1	z	x
    x
endfunction

" Change two space tabs to four
command! Tab2Space call Tab2Space()
function! Tab2Space()
    %s/  /	/
    retab
endfunction

" Propagate last change to word under cursor within file
nnoremap <F9> u*N.:%s//<c-r><c-w>/I<cr><c-o>zz

" Propagate last change to word under cursor in directory and below.
" Add changes to edit list.
nnoremap <s-F9> :call DirectoryReplace()<cr>
function! DirectoryReplace()
	let current_file = expand('%:p')
	let alternate_file = expand('#:p')
	normal "xyiwu"zyiw
	let directory = expand('%:p:h')
	execute 'args' directory . '/**/*'
	execute 'silent! argdo' '%s/\<' . @z . '\>/' . @x . '/I'
	execute 'e' alternate_file
	execute 'e' current_file
	normal *N
	vim;;**/*
endfunction

" Add instances of word under cursor in directory and below
nnoremap <c-8> *N:vim;;**/*<cr>

" Shuffle lines
"command! ShuffleLines call ShuffleLines()
"function! ShuffleLines()
"	echom system('python ~/.config/vim/vimfiles/scripts/shuffle-lines.py ' .  expand('%:p'))
"	call timer_start(0, {tid -> execute('silent! %s/')})
"	redraw!
"	e
"endfunction


command! -range=% ShuffleLines <line1>,<line2>call ShuffleLines()
function! ShuffleLines() range
    normal mz
    " User made no selection. Copy all lines.
    if a:firstline == 1 && getline(a:lastline) == getline('$')
        let all_lines = 1
        normal gg"*yG`z
    " User made selection. Copy selected lines.
    else
        let all_lines = 0
        normal gv"*y
    endif
    let lines = system('python ' . '~/.config/vim/vimfiles/scripts/shuffle-lines.py ')
    if all_lines
        lockmarks normal gg"_dG"*p`z
    else
        lockmarks normal gv"_d"*P`z
    endif
endfunction


" Creates a buffer with
" Doesn't work yet
command! Rename call Rename()
function! Rename()
    e! rename.txt
    r!echo *.tif
    s/ /\r
    normal ggddvip$ygvA renamed/$p
    w
    let @q = :echo '0y$:!cp "'
    echo "Make changes, select all, then :norm @q"
endfunction

" Toggle relative line numbering from command mode for the purpose of moving
" or copying by aboslute line number
nnoremap <c-q> :set relativenumber!<cr>

" Collapse one sentence per line into one line per paragraph
command! LinesToParagraph %s/\([;.,:]\)$\n\([a-zA-Z]\)/\1 \2
