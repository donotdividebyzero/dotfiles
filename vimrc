" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-commentary'


Plug 'flazz/vim-colorschemes'
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'raimondi/delimitmate'

Plug 'vim-vdebug/vdebug'
" Initialize plugin system
call plug#end()


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
map <C-f> <plug>(fzf-complete-file)

set number
let g:airline#extensions#tabline#enabled = 1
syntax on
map <C-n> <plug>NERDTreeTabsToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

colorscheme gruvbox
set background=dark
set tabstop=8 
set softtabstop=0 expandtab 
set shiftwidth=4 
set smarttab
set updatetime=100
set nu
set incsearch
set noerrorbells visualbell t_vb=
set path+=**

if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif

let g:vdebug_options.port = 9001
let g:vdebug_options.ide_key = 'xdebug'
let g:vdebug_options.path_maps = { '/var/www/html/wp5/wp' : '/home/maciejvel/PhpstormProjects/bullitt/wp5/wp' }


packadd termdebug
