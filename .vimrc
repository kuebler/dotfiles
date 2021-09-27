set nocompatible

filetype off "required by vundle

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/MatchTagAlways'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sukima/xmledit'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-markdown'
Plugin 'godlygeek/tabular'

call vundle#end()

filetype plugin indent on

" airline config
set t_Co=16
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

syntax enable

" solarized color scheme
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

set ruler
set showcmd
set autoindent
set nowrap
set showmatch
set backupdir=~/.tmp
set directory=~/.tmp
set autoread
set sw=2
set smarttab
set relativenumber
set wildmenu
set clipboard=unnamedplus
set clipboard+=unnamed
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround
set hlsearch
set hidden
set backspace=indent,eol,start
set history=1000
set gcr=a:blinkon0


" nerdtree config
" open nerdtree if vim was called without command line arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left is nerdtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Format xml files using xmllint
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" xml tag matching
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
  \ 'html': 1,
  \ 'xhtml': 1,
  \ 'xml': 1,
  \ 'xslt': 1,
  \ 'jinja': 1,
  \ 'eruby': 1,
  \ 'django': 1,
  \ 'htmldjango': 1,
  \}

" disable ycm diagnostic ui
let g:ycm_show_diagnostics_ui = 0

" syntastic syntax checker
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let mapleader = ","
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>tn :tabnext<CR>
nnoremap <leader>% :MtaJumpToOtherTag<CR>
map <leader>tp :tabprevious<CR>
map <leader>p "+p
map <leader>P "+P
vnoremap <C-c> "+y
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
map <leader>c :set list!<CR>
map <C-h> :nohl<CR>
set wrap linebreak nolist
