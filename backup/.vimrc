if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()

" Core
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'

" Comment
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'

" Explorer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/netrw.vim'
Plug 'mhinz/vim-grepper'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Selection
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
" Plug 'wellle/targets.vim'

" Alignment
Plug 'godlygeek/tabular'

" Convert
Plug 'tpope/vim-abolish'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Indent
Plug 'nathanaelkane/vim-indent-guides'

" Completion
Plug 'Valloric/YouCompleteMe'

" Snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Lang
Plug 'toml-lang/toml'
Plug 'leafgarland/typescript-vim'

" Icon
Plug 'ryanoasis/vim-devicons'

" Theme
Plug 'flazz/vim-colorschemes'
" Plug 'chriskempson/base16-vim'

call plug#end()

set mouse-=a
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
set formatoptions-=cro
set background=light
set t_Co=256
syntax on
set pastetoggle=<F2>
set encoding=UTF-8
set t_md=
colorscheme onedark
set nowrap
filetype plugin indent on
set hlsearch
set cursorline 

map <C-\> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>

" -------------------------------------------------------------------------
" Settings
" -------------------------------------------------------------------------

let g:multi_cursor_use_default_mapping = 1
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_exit_from_visual_mode = 0

let g:airline_powerline_fonts = 1

let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

let g:ycm_server_python_interpreter = 'ycmd-python'

" -------------------------------------------------------------------------
" Functions
" -------------------------------------------------------------------------

command! -bang -nargs=+ -complete=dir AgIn call fzf#vim#ag_raw(<q-args>, <bang>0)
