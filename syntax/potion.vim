if exists("b:current_syntax")
    finish
endif

syntax keyword potionKeyword to times
highlight link potionKeyword Keyword

let b:current_syntax = "potion"
