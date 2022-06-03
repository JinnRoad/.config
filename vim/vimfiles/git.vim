cnoremap gs<cr>     !git status -bsu<cr>
cnoremap ga<cr>     !git add . && git log --graph -10 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%C(bold blue)\%an\%Creset \%s \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>
cnoremap gc<cr>     !git commit -v<cr>
cnoremap gp<cr>     !git push<cr>
cnoremap gac<cr>    !git add . && git commit -v; git log --graph -10 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%C(bold blue)\%an\%Creset \%s \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>
cnoremap gacp<cr>   !git add . && git commit -v && git push ; git log --graph -10 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%s \%C(bold blue)\%an\%Creset \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>
cnoremap gad<cr>    !git add<cr>
cnoremap gd<cr>     !git diff<cr>
cnoremap gl<cr>     !git log --graph -10 --pretty=format:'\%Cred\%h\%Creset \%Cgreen\%cs\%Creset \%C(bold blue)\%an\%Creset \%s \%C(yellow)\%D\%Creset' && echo && git status -bsu<cr>
