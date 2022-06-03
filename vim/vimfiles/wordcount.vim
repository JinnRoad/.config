function! WordCount()
    if has_key(wordcount(),'visual_words')
        return wordcount().visual_words."/".wordcount().words " count selected words
    else
        return wordcount().cursor_words."/".wordcount().words " or shows words 'so far'
    endif
endfunction
