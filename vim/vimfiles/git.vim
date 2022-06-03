nnoremap \gs    :!git status -bsu<cr>
nnoremap \ga    :!git add . && git log --graph -10 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%C(bold blue)\%an\%Creset \%s \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>
nnoremap \gc    :!git commit -v<cr>
nnoremap \gp    :!git push<cr>
nnoremap \gac   :!git add . && git commit -v; git log --graph -10 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%C(bold blue)\%an\%Creset \%s \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>
nnoremap \gacp  :!git add . && git commit -v && git push ; git log --graph -10 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%s \%C(bold blue)\%an\%Creset \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>
nnoremap \gad   :!git add<cr>
nnoremap \gd    :!git diff<cr>
nnoremap \gl    :!git log --graph -10 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%C(bold blue)\%an\%Creset \%s \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>

augroup git_changes
    autocmd!
    autocmd InsertLeave * call ShowGitChanges(2)
augroup END

function! ShowGitChanges(tolerance)
    let changes = len(split(system('git status --porcelain'), '\n'))
    if changes < a:tolerance
        hi User9        ctermbg=8
        hi LineNr       ctermbg=8
        hi TabLineFill  ctermbg=8 cterm=none
    else
        hi User9        ctermbg=1
        hi LineNr       ctermbg=1
        hi TabLineFill  ctermbg=1 cterm=none
    endif
endfunction
