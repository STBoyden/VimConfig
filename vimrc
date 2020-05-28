set number
set nocompatible
syntax on
colorscheme monokai

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


" auto generate tags on save
au BufWritePost *.py,*.c,*.cpp,*.h,*.hpp silent! !eval 'ctags -R -o newtags; mv newtags tags' &

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

" bindings to jump to specific point
inoremap <Bslash><Bslash> <Esc>/<++><Enter>"_c4l

" bindings for opening a file in the current working directory
nnoremap <C-o> :e 
inoremap <C-o> <ESC>:e 

" bindings for closing current buffer and creating a new empty one
nnoremap <C-q> :enew\|bdelete# <CR>
inoremap <C-q> <ESC>:enew\|bdelete# <CR>
nnoremap <S-C-q> :q<CR>
inoremap <S-C-q> <Esc>:q<CR>

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
inoremap {<SPACE> {<SPACE><SPACE>}<space><++><Esc>F{lli

inoremap [<CR> [<CR>]<Esc>ko
inoremap [<SPACE> [<SPACE><SPACE>]<space><++><Esc>F[lli

inoremap (<CR> (<CR>)<Esc>ko
inoremap (<SPACE> (<SPACE><SPACE>)<space><++><Esc>F(lli

inoremap <<CR> <<CR>><Esc>ko
inoremap <<SPACE> <<SPACE><SPACE>><space><++><Esc>0f<lli

" auto insert matching quote
inoremap """ """<CR>"""<Esc>ko
inoremap " ""<++><Esc>4hi
inoremap ''' '''<CR>'''<Esc>ko
inoremap ' ''<++><Esc>4hi

" use tab to indent
nnoremap <Tab> >>
vnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <S-Tab> <<
inoremap <S-Tab> <Esc><<i
