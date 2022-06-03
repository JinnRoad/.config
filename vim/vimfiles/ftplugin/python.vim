" TODO unittest macros
" TODO unittest parametrization macros

" Find next field <>
nnoremap <buffer> \<tab> gg/<#TODO><cr>zz"cca<
inoremap <buffer> \<tab> ugg/<#TODO><cr>zz"cca<

" Begin function and add testing
" Use 'z to return to `pass`
inoremap <buffer> def<tab> def <#TODO>(<#TODO>):<cr><tab>pass
    \mmG2o`mk^w"zyiw}o 
    \for _i, _o in ((<#TODO>), <#TODO>): assert (_f := <#TODO>, _r := _f(_i))[1] == _o, f'{_f.__name__}({_i})\nExpected       {_o}\nReturned       {_r}'<cr>u
    \gg/<#TODO><cr>zz"cca<

" Add input-output pair to assert
nnoremap <buffer> \a mm?def<cr>w"zyiw/assert.*z<cr>0f:hi (, <#TODO>),F(a

" Begin comprehension internals
inoremap <buffer> comp<tab> <#TODO> for <#TODO> in <#TODO>gg/<#TODO><cr>"cca<

" Wrap variable in function
nnoremap <buffer> \w ciw()PF(i
vnoremap <buffer> \w c()Pgvoi

" Write assert statement
"<buffer> nnoremap \a   mzG2o`z^w"zyiw}o assert z(<#TODO>) == <#TODO>gg/<#TODO><cr>"cca<
"<buffer> inoremap \a mzG2o`z^w"zyiw}o assert z(<#TODO>) == <#TODO>gg/<#TODO><cr>"cca<

" Begin class
inoremap <buffer> class<tab> class <#TODO>:<cr><tab>def __init__(self, <#TODO>):gg/<#TODO><cr>"cca<

" Convert __init__ args to properties
nnoremap <buffer> \i mz0f,"zyt)oz0"zyt,dw:s/, \(\w*\)/zself.__\1 = \1\r`z
inoremap <buffer> \i mz0f,"zyt)oz0"zyt,dw:s/, \(\w*\)/zself.__\1 = \1\r`z

" Make accessors from property
nnoremap <buffer> \gsd mzG2o`z
    \"zyy}"zp$"zyiwO@propertydef z(self):jIreturn f D
    \"xyap}"xplCz.setterj0f)i, valuej^dwA = value
    \"xyap}"xpf.lCdeleterj0f,dt)jIdel f D`zj

" Print iterator
inoremap <buffer> print<tab> print(*<#TODO>, sep='\n')gg/<#TODO><cr>zz"cca<
