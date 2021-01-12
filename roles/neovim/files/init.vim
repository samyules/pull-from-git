set mouse=a

if exists('+termguicolors')
  set termguicolors
endif

" Install vim-plug if it doesn't exist
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

" Check for newest neovim for lua plugins
if !has('nvim-0.5')
  source ~/.config/nvim/pluginsv4.vim
else
  source ~/.config/nvim/pluginsv5.vim
endif

" Automatically install missing plugins on startup
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | q | endif
