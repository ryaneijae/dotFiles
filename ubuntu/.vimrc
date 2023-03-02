:set nocompatible
:set backspace=indent,eol,start
:set nocompatible
:set backspace=indent,eol,start


set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set number
set nowrap

autocmd bufnewfile *.py so /home/kdx-software/personal/dotFiles/ubuntu/py_header.txt
autocmd bufnewfile *.cpp so /home/kdx-software/personal/dotFiles/ubuntu/cpp_header.txt
autocmd bufnewfile *.sh so /home/kdx-software/personal/dotFiles/ubuntu/sh_header.txt

