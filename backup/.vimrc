if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()

" Core
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/netrw.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'

" Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'

" Tree
Plug 'scrooloose/nerdtree'

" Git
Plug 'airblade/vim-gitgutter'

" Search
Plug 'henrik/vim-indexed-search'

" Selection
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'

" Alignment
Plug 'godlygeek/tabular'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Indent
Plug 'nathanaelkane/vim-indent-guides'

" Lang
Plug 'toml-lang/toml'
Plug 'othree/javascript-libraries-syntax.vim'

" Theme
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'nightsense/vimspectr'
Plug 'altercation/vim-colors-solarized'

call plug#end()

set mouse-=a
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
set formatoptions-=cro
set background=light
set t_Co=256
syntax on
set paste
set pastetoggle=<F2>
set encoding=UTF-8
set t_md=
colorscheme onedark
set nowrap

map <C-\> :NERDTreeToggle<CR>

let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 0

let g:multi_cursor_use_default_mapping = 1
let g:multi_cursor_exit_from_insert_mode = 0

let g:airline_powerline_fonts = 1

let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

let g:jellybeans_use_lowcolor_black = 1
