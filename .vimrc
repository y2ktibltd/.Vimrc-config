syntax on

set nu
set showmatch
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set noerrorbells visualbell t_vb=
set nowrap
set smartcase
set noswapfile
set incsearch
set pastetoggle=<F2>
map <F8> :call RunCode()<CR>

call plug#begin()
call plug#end()

function RunCode()
    let file_ext=expand('%:e')
    if file_ext=='py'
        :w!
        :term ./%
    elseif file_ext=='c'
	if match(readfile(expand("%:p")),"include <math.h>")!=-1
	        :w!
	        :!gcc -Wall % -o %<.out -lm
	        :term ./%<.out
	elseif match(readfile(expand("%:p")),"include <gtk/gtk.h>")!=-1
	        :w!
	        :!gcc -Wall % -o %<.out $(pkg-config --cflags --libs gtk+-3.0)
	        :term ./%<.out
	else
	        :w!
	        :!gcc -Wall % -o %<.out
	        :term ./%<.out
	endif
    elseif file_ext=='sh'
	:w!
	:term sh ./%
    endif
endfunction
