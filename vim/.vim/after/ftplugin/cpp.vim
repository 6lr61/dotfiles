setlocal expandtab tabstop=2 shiftwidth=2

if executable('clang-format')
    augroup filetype_cpp
        autocmd!
	autocmd BufWrite *.[ch]pp :kk
        autocmd BufWritePre *.[ch]pp silent! :%!clang-format --style=llvm
	autocmd BufWrite *.[ch]pp :'k
    augroup END
endif
