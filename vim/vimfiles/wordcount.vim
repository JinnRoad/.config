function! WordCount()
    if has_key(wordcount(),'visual_words')
        return wordcount().visual_words
    else
        return wordcount().words
    endif
endfunction

" Paste/update a word-count indicator at the top of the buffer
" Optional: Place marks s and e for the start and end
command! WordCount call InsertWordCount()
function! InsertWordCount()
    normal mz
    try
        normal 'sV'e
        let @z = wordcount().visual_words
    catch
        let @z = wordcount().words
    endtry
    normal 
    if search('Word count', '') > 0
        normal $bdiw"zP
    else
        normal ggO
        normal O[Word count: ]
        normal "zP
    endif
    normal `z
    echo "Word count: " . @z
endfunction


"function! WordCount_()
"    if has_key(wordcount(),'visual_words')
"        return wordcount().visual_words."/".wordcount().words " count selected words
"    else
"        return wordcount().cursor_words."/".wordcount().words " or shows words 'so far'
"    endif
"endfunction

