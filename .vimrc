set nocompatible
execute pathogen#infect()

" execute .vimrc in working directory
set exrc


"set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm

"let g:lucius_no_term_bg=1
"let g:lucius_use_bold=1
"colorscheme lucius

set hidden

if has('gui_running')
    set guioptions-=mTrL
    set background=light
    set guifont=DejaVu\ Sans\ Mono\ 8 
else
    set background=dark
    "let g:solarized_termtrans = 1
endif

call togglebg#map("<F5>")
syntax enable
let g:solarized_hitrail=1
let g:solarized_visibility="low"
"let g:solarized_termcolors=256
colorscheme solarized

set tabstop=4 shiftwidth=4 expandtab 
set nowrap

" Russian keymaps
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"spell
set spell spelllang=ru_yo,en_us

set tags+=./%:p:t:r.tags
filetype plugin on
filetype indent on


nohlsearch
set incsearch
set clipboard=unnamed
set cursorline

let g:tex_flavor = "latex"

set list listchars=tab:▸\ ,eol:¬

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

nmap <silent> <A-K> :wincmd K<CR>
nmap <silent> <A-J> :wincmd J<CR>
nmap <silent> <A-H> :wincmd H<CR>
nmap <silent> <A-L> :wincmd L<CR>

nmap <silent> c :wincmd c<CR>
nmap <silent> v :wincmd v<CR>
nmap <silent> s :wincmd s<CR>
nmap <silent> o :wincmd o<CR>

nmap <silent> k :wincmd k<CR>
nmap <silent> j :wincmd j<CR>
nmap <silent> h :wincmd h<CR>
nmap <silent> l :wincmd l<CR>

nmap <silent> K :wincmd K<CR>
nmap <silent> J :wincmd J<CR>
nmap <silent> H :wincmd H<CR>
nmap <silent> L :wincmd L<CR>

nmap <silent> p :cp<CR>
nmap <silent> n :cn<CR>

" Tabs managment
nmap <silent> <A-S-]> gt
nmap <silent> <A-S-[> gT
nmap <silent> <A-1> 1gt
nmap <silent> <A-2> 2gt
nmap <silent> <A-3> 3gt
nmap <silent> <A-4> 4gt
nmap <silent> <A-5> 5gt
nmap <silent> <A-6> 6gt
nmap <silent> <A-7> 7gt
nmap <silent> <A-8> 8gt
nmap <silent> <A-9> 9gt
nmap <silent> <A-0> :tablast<CR>

nmap <silent> 1 1gt
nmap <silent> 2 2gt
nmap <silent> 3 3gt
nmap <silent> 4 4gt
nmap <silent> 5 5gt
nmap <silent> 6 6gt
nmap <silent> 7 7gt
nmap <silent> 8 8gt
nmap <silent> 9 9gt
nmap <silent> 0 :tablast<CR>

"nmap gh :find %:p:t:r.h<CR>
"nmap gc :find %:p:t:r.cpp<CR>
nmap ,s :find %:t:r.cpp<CR>
nmap ,S :sf %:t:r.cpp<CR>
nmap ,h :find %:t:r.h<CR>
nmap ,H :sf %:t:r.h<CR>


map <F2> :set spell!<CR>

" File type addons
augroup filetype
    au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END

augroup filetype
    au! BufRead,BufNewFile *.td set filetype=tablegen
augroup END

augroup filetype
  au! BufRead,BufNewFile *Makefile*     set filetype=make
augroup END
