function! WordCount()
    " Count visual selection
    if has_key(wordcount(),'visual_words')
        return wordcount().visual_words
    " Count entire document
    else
        return wordcount().words
    endif
endfunction

" Echo word-count between marks
" Place marks s and e for the start and end
command! WordCountBetweenMarks call WordCountBetweenMarks()
function! WordCountBetweenMarks()
    's,'e w !wc -w | tr -d '\n'
endfunction
