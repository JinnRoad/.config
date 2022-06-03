" Encoding
scriptencoding utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1
set termencoding=utf-8

" Misc
set noshowmode " Hides Insert/Replace/Visual indicator.
set visualbell " Changes audio cues to visual
set showcmd " Shows selection dimensions
set nojoinspaces

" Tabs, whitespace, special characters
" tab characters ¸¦»
set tabstop=4 " Width of tab character
set shiftwidth=4 " Width of > command
set autoindent " Indent newlines properly
set expandtab " Change tabs to spaces
set backspace=indent,eol,start " Backspace works through boundaries
set listchars=tab:▏\ ,trail:_,extends:>,precedes:<
"set listchars=tab:¦\ ,trail:_,extends:>,precedes:<
"let &showbreak='	'
set list

" Windows and panes
set fillchars=vert:▏,eob:\ ,
set cmdheight=1 " Prevent press ENTER to continue messages (?)
set cmdwinheight=4 " Keep small <c-f> window
set splitbelow " Make new panes appear below
set splitright " Make new panes appear to the right
set laststatus=2 " Show status line

" Lines and columns
set numberwidth=1 " Use smallest numbering gutter
set colorcolumn=71 " Mark nth column. Write to the (n-1)th column
set cursorline " Highlight current line
set cursorcolumn " Highlight current column
set number " Show line numbers
set relativenumber " Show relative line numbers
set scrolloff=0
set nowrap

" Colors and highlighting
filetype plugin on
"syntax on " Not sure on AND enable are needed
syntax enable

" 0      1      2      3      4      5      6      7      8
" navy   red    green  yellow sky    pink   teal   white  black
hi Comment		ctermfg=8	ctermbg=0   cterm=none
hi ColorColumn	ctermbg=0
hi EndOfBuffer	cterm=none
hi VertSplit	cterm=none
hi LineNr		ctermfg=4   ctermbg=8
hi TabLineSel	ctermfg=0	ctermbg=4
hi TabLine	    ctermfg=4	ctermbg=8	cterm=none
hi TabLineFill	cterm=none  ctermbg=8
