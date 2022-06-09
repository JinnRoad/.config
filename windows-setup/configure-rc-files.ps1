# Configure etc rc files to point to .config (XDG base directory standard)
'source ~/.config/vim/vimfiles/vimrc'	| Out-File -encoding ascii -NoNewline -Append ~/apps/scoop/apps/git/current/etc/vimrc
'source ~/.config/bash/bashrc'		| Out-File -encoding ascii -NoNewline -Append ~/apps/scoop/apps/git/current/etc/bash.bashrc
'$include ~/.config/bash/inputrc'	| Out-File -encoding ascii -NoNewline -Append ~/apps/scoop/apps/git/current/etc/inputrc

# Configure defaults for pty used by git-bash
cp ~/.config/mintty/minttyrc ~/apps/scoop/apps/git/current/etc
