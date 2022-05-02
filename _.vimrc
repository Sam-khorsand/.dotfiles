set number
set hlsearch
set ignorecase
set ruler
set wildmenu
set showcmd
set showmode
set showmatch
set magic
set shiftwidth=4
set tabstop=4
set autoindent
set cursorline
set incsearch
set splitbelow

let mapleader = ' '

map <C-up> <C-W>k
map <C-down> <C-W>j
map <C-left> <C-W>h
map <C-right> <C-W>l

nnoremap <C-e> :e .<cr> 
inoremap <C-e> <esc>:e .<cr>

xnoremap p pgvy
" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
inoremap <C-r> <C-G>u<C-R>

:autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END

noremap <leader>c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <leader>x :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

inoremap [k <Esc>

noremap <C-t> :term<cr>
" map <c-w>N

inoremap <c-w> <c-g>u<c-w>

" nnoremap o :s/$/\r/ <cr>
" nnoremap O :s/^/\r/ <cr>

let @a="iHello World!\<CR>bye\<Esc>"

call plug#begin()

Plug 'Rigellute/shades-of-purple.vim'

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme shades_of_purple

call plug#end()

let g:gitgutter_enabled = 1

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
