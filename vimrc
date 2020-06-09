" misc settings
set noerrorbells
set relativenumber
set number
set nocompatible
syntax on
colorscheme codedark
set showcmd
set nohlsearch
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=100
let mapleader=" "
set backspace=indent,eol,start

" enable filetype plugin
filetype plugin on

" split navigation rebinds
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader><bar> :wincmd v<CR>:wincmd l<CR>:enew<CR>
nnoremap <A-p> :Rg<Space>

" indentation settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" file browser tweaks
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" binding for a new terminal tab
nnoremap <A-t> :tabnew term://zsh<CR>A
inoremap <A-t> <ESC>:tabnew term://zsh<CR>A
tnoremap <A-t> <C-\><C-n>:tabnew term://zsh<CR>A

" when entering a terminal buffer, disable numbers and releative numbers
au BufEnter * if &buftype == 'terminal' | setlocal nonumber | setlocal norelativenumber | endif

" bind Control+s to :w
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" map escape to C-\ C-n while in terminal mode
tnoremap <ESC> <C-\><C-n>

" set font and colorscheme if in gvim
if has( "gui_running" )
    set guifont=Jetbrains\ Mono\ Regular\ 11
else
    " else if in terminal vim, bind Ctrl+h & Ctrl-l Keys to next/previous tabs
    nnoremap <C-h> gT
    nnoremap <C-l> gt
endif

" keep current line in above or equal to centre of screen
nnoremap j jzz
nnoremap k kzz
nnoremap gg ggzz
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz

" bindings for opening a file in the current working directory
nnoremap <C-o> :e 
inoremap <C-o> <ESC>:e 

" bindings for closing current buffer and creating a new empty one
nnoremap <C-q> :enew\|bdelete# <CR>
inoremap <C-q> <ESC>:enew\|bdelete# <CR>
nnoremap <S-C-q> :q<CR>
inoremap <S-C-q> <ESC>:q<CR>

" bindings for opening tabs
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <ESC>:tabnew<CR>
nnoremap <C-T> :tabnew 
inoremap <C-T> <ESC>:tabnew 

" binding for closing tabs
nnoremap <C-w> :tabclose<CR>
inoremap <C-w> <ESC>:tabclose<CR>
tnoremap <C-w> <C-\><C-n>:tabclose<CR>

" use tab key to indent
nnoremap <Tab> >>
vnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <S-Tab> <<
inoremap <S-Tab> <ESC><<i

" plugins
call plug#begin( '~/.vim/plugged' )

Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'jremmen/vim-ripgrep'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'thaerkh/vim-indentguides'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end(  ) 

" --- plugin specific bindings --- 

" toggle NERDTree
map <C-b> :NERDTreeToggle<CR>

" list opened files
nnoremap <C-\> :W<CR>

" jump to definition and jump to references
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)

" open file search
nnoremap <C-p> :GFiles<CR>

" binding for commenting out lines
nnoremap // :Commentary<CR>
inoremap // <ESC>:Commentary<CR>i

" --- plugin specific settings ---

" autoclose vim when NERDTree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" autorun rustfmt on save
let g:rustfmt_autosave=1

if executable('rg')
    let g:rg_derive_root='true'
endif
