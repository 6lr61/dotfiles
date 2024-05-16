setlocal expandtab softtabstop=2 tabstop=2 shiftwidth=2

if executable('clang-format')
    augroup filetype_cpp
        autocmd!
	autocmd BufWritePre *.[ch]pp :kk
        autocmd BufWritePre *.[ch]pp silent! :%!clang-format --style=llvm
	autocmd BufWritePre *.[ch]pp :'k
    augroup END
endif
