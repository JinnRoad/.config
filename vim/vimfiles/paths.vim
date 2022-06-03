" cd quickly to directories or files
cnoremap cur<cr>	cd		~/docs/current<cr>:e <c-d>
cnoremap code<cr>	cd		~/docs/code/<cr>:e <c-d>
cnoremap etc<cr>	cd		~/apps/scoop/apps/git/current/etc/<cr>:e <c-d>
cnoremap todo<cr> 	tabe	~/docs/current/todo/todo.txt<cr>/# To do<cr>j:set nohlsearch<cr>
cnoremap rev<cr>	cd		~/docs/code/projects/review/questions<cr>:e <c-d>
cnoremap so<cr>		silent! w<cr>:source	$MYVIMRC<cr>:set filetype<cr>
cnoremap vi<cr> 	cd	    ~/.config/vim/vimfiles/<cr>:e <c-d>
cnoremap gi<cr>     tabe	~/docs/current/game_dev/game_design/ideas.md<cr>
cnoremap gr<cr>     tabe	~/docs/current/game_dev/game_design/resources.md<cr>
cnoremap games<cr>  tabe	~/docs/current/game_dev/games/platformer_tutorial/src/Actors/Enemy.gd<cr>
cnoremap docs<cr>   tab<cr>:redraw<cr>:cd ~/docs<cr>:cd <c-d>
cnoremap files<cr>   tab<cr>:redraw<cr>:cd ~/files<cr>:cd <c-d>

" Quick fix navigation
nnoremap <c-j> :cn<cr>zz
nnoremap <c-k> :cp<cr>zz

" Copy directory or path
command! CopyDirPath  execute 'let @*="' . TildaPath(expand('%:p:h')) . '"'
command! CopyFilePath execute 'let @*="' . TildaPath(expand('%:p'))   . '"'

function! TildaPath(path)
    let path = a:path
    let path = substitute(path, '^/home/' . g:user, '~', '')
    let path = substitute(path, '^/c/Users/' . g:user, '~', '')
    let path = substitute(path, '^C:\Users\' . g:user, '~', '')
    echo path
    return path
endfunction

" Convert filepath on system register between unix and windows
command! ConvertPath call ConvertPath()
function ConvertPath()
    if stridx(@*, '/') > -1
        let @* = substitute(@*, '/c/', 'C:\', 'g')
        let @* = substitute(@*, '/', '\', 'g')
    elseif stridx(@*, '\\') > -1
        let @* = substitute(@*, 'C:\\', '/c/', 'g')
        let @* = substitute(@*, '\\', '/', 'g')
    else
        echo 'Not a filepath'
    endif
    echo @*
endfunction

" Paste links to game dev resources file
let $gr = '~/docs/current/game_dev/game_design/resources.md'
nnoremap <F10> :tabe $gr<cr>gg/# Unused resource list<cr>}}}2Op
	\vip:'<,'>normal 64I gv
	\:'<,'>normal 0r-{
	\"_ddvip:sort:w<cr>:bd<cr>
    \:echo "Links added"<cr>

