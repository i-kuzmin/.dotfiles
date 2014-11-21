set nocompatible
execute pathogen#infect()

" execute .vimrc in working directory
set exrc

set textwidth=120
set tabstop=4 shiftwidth=4 expandtab 
set nowrap

set hidden

if has('gui_running')
    set guioptions=ai
    set background=light
    set guifont=DejaVu\ Sans\ Mono\ 8 
else
    set background=dark
    "let g:solarized_termtrans = 1
endif

" Plugin configuration

let g:tex_flavor = "latex"

g:goog_user_conf = {
    'langpair': 'en|ru', "language code iso 639-1
    'cmd': 'node',
    'v_key': 'T' "? define key in visual-mode (optional)
}

let g:solarized_hitrail=1
let g:solarized_visibility="low"

syntax enable
colorscheme solarized

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


map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

call togglebg#map("<F5>")
map <F2> :set spell!<CR>

"command! Highlihgt exe printf('match IncSearch /\<%s\>/', expand('<cword>'))

" File type addons
augroup filetype
    au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END

augroup filetype
    au! BufRead,BufNewFile *.td set filetype=tablegen
augroup END

augroup filetype
  au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END

