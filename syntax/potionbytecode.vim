if exists("b:current_syntax")
    finish
endif

syntax keyword potionbytecodeKeyword setlocal getlocal
syntax keyword potionbytecodeKeyword getupval setupval
syntax keyword potionbytecodeKeyword loadpn loadk
syntax keyword potionbytecodeKeyword move mult
syntax keyword potionbytecodeKeyword message call
syntax keyword potionbytecodeKeyword proto bind add
syntax keyword potionbytecodeKeyword return self

syntax match potionbytecodeComment "\v;.*$"

highlight link potionbytecodeKeyword Keyword
highlight link potionbytecodeComment Comment

let b:current_syntax = "potionbytecode"
