" Switch arguments (xx, yy, zz) left or right.
" Currently does not work for arguments such as (float xx, int yy, string zz)

nnoremap L f,h"zdiw"_dwviw<esc>a,<space><esc>"zpb
nnoremap H F,w"zdiwb"_dwhviwo<esc>"zPa,<space><esc>bb
