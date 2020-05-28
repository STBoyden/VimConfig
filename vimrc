" misc settings
set number
set nocompatible
syntax on
colorscheme monokai
set showcmd

" enable filetype plugin
filetype plugin on

" automatically set makeprg variable depending on filetype
au FileType c,cpp,h,hpp set makeprg=./make
au FileType py          set makeprg=python3\ expand('%:p')
au FileType rs          set makeprg=cargo\ build

" keybind to execute makprg
nnoremap <F5> :make<CR>
inoremap <F5> <Esc>:make<CR>

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

" autoset makeprg depending on filetype

" set font and colorscheme if in gvim
if has( "gui_running" )
    set guifont=Jetbrains\ Mono\ Regular\ 11
else
    " else if in terminal vim, bind Ctrl+Arrow Keys to next/previous tabs
    nnoremap <C-Right> gt
    nnoremap <C-Left> gT
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
