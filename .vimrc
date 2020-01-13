execute pathogen#infect()

filetype plugin indent on
syntax on 

set wildmenu 
colo dracula     
" Turn off swaps
set noswapfile
 
" Add line numbers
set number 

" Line guide 
set colorcolumn=80

" Set fold method
set foldmethod=indent
set foldopen+=jump
" set foldnestmax=10
" set nofoldenable

" Format tabbing
set breakindent
set tabstop=2
set shiftwidth=2 softtabstop=0 expandtab smarttab
set listchars=tab:\|\ 
set expandtab
set list

set autoindent 

" Set autoread to detect changes that have been made to a file outside of Vim
" (i.e. changing your git branch will trigger an autoreload of all files)
set autoread
set hidden

" Configure the backspace delete 
set backspace=indent,eol,start

" Performance upgrades
set ttyfast
set lazyredraw

"  This moves up and down visual lines, not real lines. 
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

"  This allows you to capitalize J and K such that they move 5 lines in either
"  direction.
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

"  do something for C, to change the rest of the line

" Copy relative file path of current buffer to clipboard
noremap <silent> cp :let @+=expand("%")<CR>
" Copy absolute file path of current buffer to clipboard
noremap <silent> cP :let @+=expand("%:p")<CR>

"  ALIASES 
"  Get the blame
"  :command! Blame w !git blame -- % 

"  Print out unsaved differences to the file
:command! Diff w !diff % -

"  Reload the current file
" :command! Reload w e!

"  Find and delete the double quotes 
let @z='0f"r''f"r''j'

" Set plugins
" set the thing for fzf
set rtp+=/usr/local/opt/fzf
noremap <silent> <C-P> :Files<CR>
noremap <silent> <C-F> :Ag<CR>

noremap <silent> <C-n> :e.<CR>


" Set plugins
" set runtimepath^=~/.vim/bundle/nerdtree
" set runtimepath^=~/.vim/bundle/ctrlp.vim
"  Clear control p cache
" :command! Clearcache CtrlPClearAllCaches

"  NERDtree configurations
" let g:NERDTreeWinSize=40
" map <C-n> :NERDTreeToggle<CR>

"     Have NERDTree show dotfiles 
" let NERDTreeShowHidden=1

"  ControlP configurations
" let g:ctrlp_cmd='CtrlP'
" let g:ctrlp_max_files=0 
" let g:ctrlp_max_depth=40

