set number
syntax on
colorscheme monokai

" indentation settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" set font if in gvim
if has( "gui_running" )
    set guifont=Jetbrains\ Mono\ Regular\ 11
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

" bindings for opening tabs
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <ESC>:tabnew<CR>
nnoremap <C-T> :tabnew 
inoremap <C-T> <ESC>:tabnew 


" binding for closing tabs
nnoremap <C-w> :tabclose<CR>
inoremap <C-w> <ESC>:tabclose<CR>

" auto insert matching brace
inoremap {<CR> {<CR>}<Esc>ko
inoremap {<SPACE> {<SPACE><SPACE>}<Esc>hi

inoremap [<CR> [<CR>]<Esc>ko
inoremap [<SPACE> [<SPACE><SPACE>]<Esc>hi

inoremap (<CR> (<CR>)<Esc>ko
inoremap (<SPACE> (<SPACE><SPACE>)<Esc>hi

inoremap <<CR> <<CR>><Esc>ko
inoremap <<SPACE> <<SPACE><SPACE>><Esc>hi

" auto insert matching quote
inoremap """ """<CR>"""<Esc>ko
inoremap " ""<Esc>i
inoremap ''' '''<CR>'''<Esc>ko
inoremap ' ''<Esc>i

" use tab to indent
nnoremap <Tab> >>
vnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <S-Tab> <<
