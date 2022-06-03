" Find next <#TODO>
nnoremap <buffer> \<tab> gg/<#TODO><cr>zz"cca<
inoremap <buffer> \<tab> ugg/<#TODO><cr>zz"cca<

" Navigate between SQL keyword
nnoremap <buffer> [[ ?^\s\@!<cr>:set nohlsearch<cr>
nnoremap <buffer> ]] /^\s\@!<cr>:set nohlsearch<cr>
inoremap <buffer> [[ ?^\s\@!<cr>:set nohlsearch<cr>
inoremap <buffer> ]] /^\s\@!<cr>:set nohlsearch<cr>

"" Keyword shortcuts
"inoremap <buffer> c<tab> case<tab>when <#TODO> then <#TODO><cr>end as <#TODO>gg/<#TODO><cr>zz"cca<
"inoremap <buffer> d<tab> distinct<space>
"inoremap <buffer> g<tab> <esc>gIgroup by<tab><#TODO>gg/<#TODO><cr>zz"cca<
"inoremap <buffer> h<tab> <esc>gIhaving<tab><tab><#TODO>gg/<#TODO><cr>zz"cca<
"inoremap <buffer> j<tab> <esc>gIjoin<tab><tab><#TODO><cr><tab>on<tab><tab><#TODO>gg/<#TODO><cr>zz"cca<
"inoremap <buffer> lj<tab> <esc>gIleft join<tab><#TODO><cr><tab>   on<tab><tab><#TODO>gg/<#TODO><cr>zz"cca<
"inoremap <buffer> cj<tab> <esc>gIcross join<tab><#TODO><cr>gg/<#TODO><cr>zz"cca<
"inoremap <buffer> l<tab> <esc>gIlimit<tab><tab><#TODO>gg/<#TODO><cr>zz"cca<
"inoremap <buffer> o<tab> <esc>gIorder by<tab><#TODO>gg/<#TODO><cr>zz"cca<
"inoremap <buffer> s<tab> select<tab><tab><#TODO><cr>from<tab><tab><#TODO>;gg/<#TODO><cr>zz"cca<
"inoremap <buffer> w<tab> <esc>gIwhere<tab><tab><#TODO>gg/<#TODO><cr>zz"cca<
"inoremap <buffer> wn<tab> when<tab><tab><#TODO>gg/<#TODO><cr>zz"cca<
"inoremap <buffer> u<tab> <esc>/;<cr>ddi<space>union<cr>s<tab>
"inoremap <buffer> and<tab> <space><space>and<tab><tab><#TODO>gg/<#TODO><cr>zz"cca<
"inoremap <buffer> or<tab> <space><space><space>or<tab><tab><#TODO>gg/<#TODO><cr>zz"cca<
"vnoremap <buffer> w<tab> cwith results as (<cr><tab><esc>]pkdd/;<cr><<O<space>)<cr>select<tab><#TODO><cr>from<tab><tab>resultsgg/<#TODO><cr>zz"cca<

" The below are deprecated by the following map
" Append new line to query
" nnoremap <buffer> <c-s-o> /;<cr>"zxo<esc>"zpI
" Insert new line into middle of query
" nnoremap <buffer> o yyp0viwr<space>wC
"nnoremap <buffer> o :call NewLineModification('o')<cr>
"nnoremap <buffer> O :call NewLineModification('O')<cr>
"inoremap <buffer> <cr> <esc>:call ReturnCarriageModification()<cr>
nnoremap <buffer> <c-s-o> /;<cr>"zxo;<esc>i

function! NewLineModification(up_down)
    let tmp_reg = @"
    if a:up_down ==# 'O'
        if line('.') == 1
            normal! O
            startinsert
            return
        endif
        normal k
    endif
    normal "zyy
    let current_line = trim(getline('.'), ' \t', 2)
    if current_line[-1:] == ';'
        normal! o
    elseif current_line == ''
        normal! o
    else
        execute 'normal "zp0viwr wC '
    endif
    startinsert
    let @" = tmp_reg
endfunction

function! ReturnCarriageModification()
    let tmp_reg = @"
    if trim(getline('.'), ' \t', 2) == ''
        normal o
        startinsert
        return
    endif
    normal l"zyl
    if @z == ';'
        execute "normal! i\<cr>"
    else
        call NewLineModification('o')
    endif
    let @" = tmp_reg
    startinsert
endfunction


