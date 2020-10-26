" misc settings
set noerrorbells
set relativenumber
set number
set nocompatible
set mouse=a
syntax on
set termguicolors
set showcmd
set nohlsearch
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
let mapleader=" "
set backspace=indent,eol,start

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
else
    " colorscheme base16-materia
   colorscheme base16-tomorrow-night-transparent
endif

hi NonText guifg=bg
hi vertsplit guifg=fg guibg=bg

" enable filetype plugin
filetype plugin on

" split navigation rebinds
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader><bar> :wincmd v<CR>:wincmd l<CR>:enew<CR>
nnoremap <Leader>p :Rg<Space>

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
" nnoremap <A-t> :tabnew term://zsh<CR>A
" inoremap <A-t> <ESC>:tabnew term://zsh<CR>A
" tnoremap <A-t> <C-\><C-n>:tabnew term://zsh<CR>A
" nnoremap <A-\> :wincmd v<CR>:wincmd l<CR>:term<CR>:setlocal nonumber norelativenumber<CR>A

" when entering a terminal buffer, disable numbers and releative numbers
au BufEnter,TabEnter,WinEnter * if &buftype == 'terminal' | setlocal nonumber | setlocal norelativenumber | endif

" Organise imports on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

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

" bindings for closing current buffer and creating a new empty one and closing
" tabs
nnoremap qQ :enew\|bdelete# <CR>
inoremap qQ <ESC>:enew\|bdelete# <CR>
nnoremap qq :q<CR>
inoremap qq <ESC>:q<CR>
nnoremap QQ :tabclose<CR>
inoremap QQ <ESC>:tabclose<CR>
tnoremap QQ <C-\><C-n>:tabclose<CR>

" bindings for opening tabs
" inoremap <C-t> <ESC>:tabnew<CR>
" nnoremap <C-T> :tabnew 
" inoremap <C-T> <ESC>:tabnew 
" nnoremap <C-t> :tabnew<CR>
nnoremap qt :tabnew<CR>:e 
inoremap qt <ESC>:tabnew<CR>:e 

" binding for closing tabs

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
Plug 'OmniSharp/omnisharp-vim'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-rooter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'voldikss/vim-floaterm'
Plug 'aurieh/discord.nvim', {'do' : ':UpdateRemotePlugins'}
Plug 'itchyny/lightline.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'elmcast/elm-vim'
Plug 'gilligan/vim-lldb'
Plug 'preservim/tagbar'
Plug 'rhysd/vim-clang-format'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'mattn/emmet-vim'
Plug 'HerringtonDarkholme/yats.vim'

call plug#end(  ) 

" --- plugin specific bindings --- 

" toggle NERDTree
" map <C-b> :NERDTreeToggle<CR>

" list opened files
nnoremap <C-\> :W<CR>

" jump to definition and jump to references
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)
map <C-b> :CocCommand explorer<CR>

" open file search
nnoremap <C-p> :GFiles<CR>
map <A-p> :FZF<CR>

nmap <F8> :TagbarToggle<CR>

" binding for commenting out lines
nnoremap ## :Commentary<CR>
inoremap ## <ESC>:Commentary<CR>i

" --- plugin specific settings ---

" autoclose vim when NERDTree is the last buffer
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

autocmd FileType rust nnoremap mm :make build<CR>
autocmd FileType rust nnoremap MM :make build --release<CR>
autocmd FileType rust nnoremap mr :make run<CR>
autocmd FileType rust nnoremap MR :make run --release<CR>

augroup rainbow
    autocmd FileType rust,cpp,c,h,hpp,cs,py,js,ts,vim,cfg RainbowParentheses
augroup END

autocmd FileType c,cpp ClangFormatAutoEnable

let g:clang_format#code_style = "llvm"

let g:lightline = {
    \ 'colorscheme': 'Tomorrow_Night_Bright',
    \ 'active': {
    \   'left':[['mode', 'paste'],
    \           ['gitbranch', 'readonly', 'filename', 'modified']]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

let g:rooter_change_directory_for_non_project_files = 'current'

let g:AutoPairsShortcutToggle = ''

" set indent guide character
let g:indentguides_spacechar='│'
let g:indentguides_tabchar='│'

" set to nightly rustfmt
let g:rustfmt_command="~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rustfmt"
" autorun rustfmt on save
let g:rustfmt_autosave=1

if executable('rg')
    let g:rg_derive_root='true'
endif

nmap <F1> :FloatermToggle<CR>
imap <F1> <ESC>:FloatermToggle<CR>
tmap <F1> <ESC>:FloatermToggle<CR>

nnoremap '' :setlocal nu!<CR>:setlocal rnu!<CR>
