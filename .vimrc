syn on
set ruler
set showmatch
set matchpairs+=<:>
if version >= 600
	set foldenable
	set foldmethod=marker
endif

au BufRead,BufNewFile *.ddl setfiletype sql
autocmd BufRead,BufNewFile *.yml setlocal noexpandtab tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.py setlocal expandtab tabstop=4 shiftwidth=4

set hlsearch
set incsearch

colorscheme koehler
set visualbell
set noerrorbells

" To get wrapping in git commits, among other things I'm sure ...
filetype plugin on
