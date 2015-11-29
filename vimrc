filetype plugin on
filetype plugin indent on    " required
syntax on

set background=dark

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set nu
set hls
set hidden             " Hide buffers when they are abandoned
set noet ci pi sts=0 sw=4 ts=4
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Code folding
set foldmethod=syntax
set foldlevelstart=1

" Reload vimrc immediately after save
autocmd! bufwritepost .vimrc source %

" Markdown mode
filetype plugin indent on
syntax on
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_slow = 1
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd FileType markdown set spell spelllang=en_ca
autocmd FileType markdown set linebreak
autocmd FileType markdown set breakat=\ <CR>

" Python mode
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
let python_highlight_all = 1

" Lisp mode

""""" Key remaps -- Handles moving up and down
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
let mapleader=","
vnoremap < <gv
vnoremap > >gv
set clipboard=unnamedplus
imap <C-k> <esc>"_d$i
"" Quicksave
noremap <Leader>w :update<CR>
noremap <Leader>q :q<CR>
"" Quick commenting
"" Quick Buffer & Windows
map <silent><Leader>n <esc>:tabprevious<CR>
map <silent><Leader>m <esc>:tabnext<CR>
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h
"map <C-S-j> <C-w><S-j>
"map <C-S-k> <C-w><S-k>
"map <C-S-l> <C-w><S-l>
"map <C-S-h> <C-w><S-h>

" Menu completion
set wildmenu
set wcm=<TAB>
set wildmode=longest:full,full

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" vim-airline
set laststatus=2
set ttimeoutlen=50

" Enable color
" Remember to put this in .bashrc to work with terminator: export TERM=xterm-256color
highlight Comment cterm=bold
