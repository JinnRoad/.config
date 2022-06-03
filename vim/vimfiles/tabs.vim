" Maps ---------------------------------------------------------------

" To do: alt J shows tabs in verticle list, then select by number

" Always show tabs
let tablinestates = [0, 2]
let &showtabline=tablinestates[1]

" Open new tab
nnoremap <leader>t :tabe<cr>
" Show tab line. Cycle() from misc.vim
nnoremap <a-j> :let &showtabline = Cycle(&showtabline, tablinestates)<cr>
" Go to last tab (alt+6---like how ctrl-6 goes to the last buffer)
nnoremap <a-k> :execute "normal!" g:tablist[1] . "gt"<cr>
" Switch between tabs
nnoremap <a-h> :tabp<cr>
nnoremap <a-l> :tabn<cr>
" Reorder tabs to the left/right
nnoremap <a-H> :tabm-1<cr>
nnoremap <a-L> :tabm+1<cr>
" Move window to new tab
noremap <a-w> :tab sp<cr>:tabp<cr>:q<cr>:tabn<cr>
" Move window to previous tab
noremap <a-W> :let @*=expand('%:p')<cr>:tabp<cr>:vs <c-r>*<cr>:tabn<cr>:tabc!<cr>

" Functions ----------------------------------------------------------

" Redefine how tabs display
set tabline=%!TabLine()

function! TabLine()
    let line = ''
    for i in range(tabpagenr('$'))
        let line .= (i+1 == tabpagenr()) ? '%#TabLineSel#' : '%#TabLine#'
        let line .= '%' . (i + 1) . 'T'
        let line .= TabLabel(i + 1)
    endfor
    let line .= '%#TabLineFill#%T'
    return line
endfunction

function! TabLabel(n)
    " Return list of buffer numbers for each window pane open in tab.
    let buflist = tabpagebuflist(a:n) " List of buffers in tab n
    let winnr = tabpagewinnr(a:n) " Active window number (indexed from 1)
    let bufname_ = bufname(buflist[winnr - 1]) " Get bufname
    let bufdir = fnamemodify(bufname_, ':p:h:t')
    let tabname = ' ' . a:n . ' ' . bufdir . ' '
    return tabname
endfunction

" Autocmds -----------------------------------------------------------

augroup tabcommands
    autocmd!
    " Keep a list of the most recent two tabs.
    let g:tablist = [1, 1]
    autocmd TabLeave * let g:tablist[0] = g:tablist[1]
    autocmd TabLeave * let g:tablist[1] = tabpagenr()
    " When a tab is closed, return to the most recent tab.
    " The way vim updates tabs, in reality, this means we must return
    " to the second most recent tab.
    autocmd TabClosed * exe "normal! " . g:tablist[0] . "gt"
augroup END

" Globals ------------------------------------------------------------
let g:sep = has('unix') ? '/' : '\\'
