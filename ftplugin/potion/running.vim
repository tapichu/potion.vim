if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
    silent !clear
    execute "write"
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
    " Get the bytecode.
    execute "write"
    let bytecode = system(g:potion_command . " -c -V " . bufname("%") . " 2>&1")

    if v:shell_error != 0
        echom "ERROR: compilation error."
    else
        " Open a new split and set it up.
        let buff_num = bufwinnr("__Potion_Bytecode__")
        if buff_num >= 0
            execute buff_num . "wincmd w"
        else
            vsplit __Potion_Bytecode__
        endif

        normal! ggdG
        setlocal filetype=potionbytecode
        setlocal buftype=nofile

        " Insert the bytecode.
        call append(0, split(bytecode, '\v\n'))
    endif
endfunction

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :call PotionShowBytecode()<cr>
