"setlocal keymap=math
scriptencoding utf-8

" Misc
inoremap <buffer>  break u----------------------------------------
inoremap <buffer>  ( ()<left>
inoremap <buffer>  \n 80A<space>070<bar>C[ ]hr
nnoremap <buffer> \n   80A<space>070<bar>C[ ]hr

" Movement
inoremap <buffer>  ;a u<c-o>A
inoremap <buffer>  <c-l> <right>
inoremap <buffer>  <c-h> <left>

" Powers
inoremap <buffer>  ;-   u⁻¹
inoremap <buffer>  ;1   u¹
inoremap <buffer>  ;2   u²
inoremap <buffer>  ;3   u³
inoremap <buffer>  ;4   u⁴
inoremap <buffer>  ;5   u⁵
inoremap <buffer>  ^   u^()<left>
inoremap <buffer>  ;rt  u√

" Calculus
inoremap <buffer>  ;int intu[]dx<left><left><left>u

" Greek
inoremap <buffer>  `a	α
inoremap <buffer>  `b	β
inoremap <buffer>  `v	θ
inoremap <buffer>  `i	ι
inoremap <buffer>  `p	π
inoremap <buffer>  `f	φ

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
