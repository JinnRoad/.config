nnoremap \gs    :!git status -bsu<cr>
nnoremap \ga    :!git add . && git log --graph -25 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%C(bold blue)\%an\%Creset \%s \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>
nnoremap \gc    :!git commit -v<cr>
nnoremap \gp    :silent !git push<cr>
nnoremap \gac   :!git add . && git commit -v; git log --graph -25 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%C(bold blue)\%an\%Creset \%s \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>
nnoremap \gacp  :!git add . && git commit -v<cr>:silent !git push<cr>
nnoremap \gad   :!git add<cr>
nnoremap \gd    :!git diff<cr>
nnoremap \gl    :!git log --graph -25 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%C(bold blue)\%an\%Creset \%s \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>
