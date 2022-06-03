setlocal foldmethod=expr
setlocal tabstop=4
nnoremap <buffer> <F4> :GodotRunLast<CR>
nnoremap <buffer> <F5> :GodotRun<CR>
nnoremap <buffer> <F6> :GodotRunCurrent<CR>
nnoremap <buffer> <F7> :GodotRunFZF<CR>


" Cheap autocomplete by opening a buffer file with godot keywords

let $words = g:root . 'home/user/.config/vim/vimfiles/words/godot.words'

" Add word
nnoremap <buffer> <F12> mz"zyiw:tabe $words<cr>Goz:x<cr>`z:echo "Word added"<cr>

" Add line
nnoremap <buffer> <s-F12> mz^"zy$:tabe $words<cr>Goz:x<cr>`z:echo "Line added"<cr>

" Open word document in buffer
nnoremap <buffer> <F11> :tabe $words<cr>:x<cr>

" Open word document for viewing
nnoremap <buffer> <s-F11> :tabe $words<cr>G

" Run game
nnoremap <buffer> <CR> :call RunGodot()<cr>
nnoremap <buffer> <F5> :call RunGodot()<cr>
function! RunGodot()
	call system('godot -u &')
	"redraw!
endfunction
