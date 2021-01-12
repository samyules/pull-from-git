call plug#begin()

Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-sleuth'
Plug 'ryanoasis/vim-devicons'
Plug 'zefei/simple-dark'

call plug#end()

" NERDtree starting behavior (no arguments)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Startify | NERDTree | wincmd w | endif

" NERDTree starting behavior (argument is a directory)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" NERDTree closing behavior if it is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree Toggle key map
map <C-n> :NERDTreeToggle<CR>

color simple-dark
