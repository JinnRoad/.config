"setlocal keymap=math
scriptencoding utf-8

" Misc
" Add line break
inoremap <buffer>  break u----------------------------------------
" Close parens
"inoremap <buffer>  ( ()<left>
" Add note to equation
inoremap <buffer>  \n 80A<space>070<bar>C[ ]hr
nnoremap <buffer> \n   80A<space>070<bar>C[ ]hr

" Movement
inoremap <buffer>  ;a u<c-o>A
inoremap <buffer>  <c-l> <right>
inoremap <buffer>  <c-h> <left>

" Lists
" Insert item
nnoremap <buffer> <c-j> "zyy"zp0<c-a>f<tab>C<tab>
inoremap <buffer> <c-j> <esc>"zyy"zp0<c-a>f<tab>C<tab>
" Insert nested item
nnoremap <buffer> <c-k> "zyy"zp>>ciw01<esc>f<tab>C<tab>
inoremap <buffer> <c-k> <esc>"zyy"zp>>ciw01<esc>f<tab>C<tab>

" Powers
inoremap <buffer>  ;-   u⁻
inoremap <buffer>  ;0   u⁰
inoremap <buffer>  ;1   u¹
inoremap <buffer>  ;2   u²
inoremap <buffer>  ;3   u³
inoremap <buffer>  ;4   u⁴
inoremap <buffer>  ;6   u⁶
inoremap <buffer>  ;7   u⁷
inoremap <buffer>  ;8   u⁸
inoremap <buffer>  ;9   u⁹
inoremap <buffer>  ^   u^()<left>
inoremap <buffer>  ;rt  u√

" Calculus
inoremap <buffer>  ;int intu[]dx<left><left><left>u

" Greek
inoremap <buffer>  ,a	α
inoremap <buffer>  ,b	β
inoremap <buffer>  ,v	θ
inoremap <buffer>  ,i	ι
inoremap <buffer>  ,p	π
inoremap <buffer>  ,f	φ

" English letter to greek letter mapping
"a Α α
"b Β β
"c Ψ ψ
"d Δ δ
"e Ε ε
"f Φ φ
"g Γ γ
"h Η η
"i Ι ι
"k Κ κ
"l Λ λ
"m Μ μ
"n Ν ν
"o Ο ο
"p Π π
"q Χ χ
"r Ρ ρ
"s Σ σ
"t Τ τ
"u Υ υ
"v Θ θ
"w Ω ω
"x Ξ ξ
"z Ζ ζ

" Make fraction
vnoremap <buffer> ;f :call Fraction()<cr>
function! Fraction() range
    normal gvo"zy
    normal "xy0
    let string_length = strchars(@z)
    let left_cursor = strchars(@x) + 1
    execute 'normal j100A '
    execute 'normal' left_cursor . '|'
    execute 'normal' string_length . 'r─lD'
    execute 'normal j100A '
    execute 'normal' left_cursor . '|lD'
    startinsert
endfunction
