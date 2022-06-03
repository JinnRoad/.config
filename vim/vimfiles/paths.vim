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
command! CopyFileDir  execute 'let @*="' . expand('%:p:h') . '"'
command! CopyFilePath execute 'let @*="' . expand('%:p')   . '"'

" Convert filepaths between unix and windows
command! ConvertPath call ConvertPath()
function ConvertPath()
    normal mz0
    if search('/', '', line('.'))
        silent! s;/c/;C:\
        s;/;\
    elseif search('\\', '', line('.'))
        silent! s;C:\\;/c/
        s;\\;/
    else
        echo 'Not a filepath'
    endif
    normal `z
endfunction

" Paste links to game dev resources file
let $gr = '~/docs/current/game_dev/game_design/resources.md'
nnoremap <F10> :tabe $gr<cr>gg/# Unused resource list<cr>}}}2Op
	\vip:'<,'>normal 64I gv
	\:'<,'>normal 0r-{
	\"_ddvip:sort:w<cr>:bd<cr>
    \:echo "Links added"<cr>

