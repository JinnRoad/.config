" Built from $VIM/vim82/syntax/python.vim

" Ensure syntax file is only loaded once, otherwise Vim will slow down.
if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "todo"

" Create highlighting and match pattern for each place category
let places = ['curr', 'erra', 'home', 'work', ]
let i = 1
for place in places
    execute 'hi' place 'ctermfg=' . i
    execute 'syn match' place '"^' . place . '.*$"'
    let i += 1
endfor

" Create highlighting for conditional items
hi conditional ctermbg=0 cterm=none
syn match conditional ".*	if.*$"
