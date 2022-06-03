nnoremap \gs    :!git status -bsu<cr>
nnoremap \ga    :!git add . && git log --graph -10 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%C(bold blue)\%an\%Creset \%s \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>
nnoremap \gc    :!git commit -v<cr>
nnoremap \gp    :!git push<cr>
nnoremap \gac   :!git add . && git commit -v; git log --graph -10 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%C(bold blue)\%an\%Creset \%s \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>
nnoremap \gacp  :!git add . && git commit -v && git push ; git log --graph -10 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%s \%C(bold blue)\%an\%Creset \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>
nnoremap \gad   :!git add<cr>
nnoremap \gd    :!git diff<cr>
nnoremap \gl    :!git log --graph -10 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%C(bold blue)\%an\%Creset \%s \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>

function! GitChanges()
    let x = system('git status --porcelain &')
    echo x
endfunction
