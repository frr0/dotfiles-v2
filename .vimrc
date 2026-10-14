set relativenumber number
set mouse=a
colorscheme slate
syntax on

nnoremap \ 0
vmap \ 0
nnoremap 0 $
vmap 0 $
nnoremap + {
nnoremap - }
vnoremap + {
vnoremap - }
nnoremap gc :%s/
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <c-m> :wa \| :!make <cr>
nnoremap <c-w> :vsp <cr>
nnoremap <c-i> :split <cr>

" yank
nnoremap Y y$
nnoremap yt 0y$

" brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap { {}<left>

"indent
nnoremap g0 gg=GGG
vnoremap < <gv
vnoremap > >gv
