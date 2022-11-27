set nocompatible " Disable vi compatability
set noerrorbells
filetype on " Can detect file type
filetype plugin on " Loads plugin file for the file
filetype indent on " Indent file, autoindentation
syntax on
set number " line numbers
set relativenumber " relative line numbers
set signcolumn=yes " Extra error/message column on left

set mouse=a " mouse editing

" set termguicolors " Makes colors work in tmux


set tabstop=4 " Spaces in a tab
set shiftwidth=4 " Spaces in an indent, helps with autoindent
set softtabstop=4 " 
set expandtab " Uses spaces even when tabbing
set nowrap " No line wrapper

set smartindent "C style indentation

set ignorecase " Ignore case when searching
set smartcase " If searching for capitals, include only capitals 
set showmatch " Show matching words during search
set hlsearch " Highlighting during search
set incsearch

set scrolloff=8

" set nohlsearch " Disable the highlighting after done searching

set hidden " Keep extra buffer of save state, hides files instead of closes it

set signcolumn=yes
set cmdheight=2

set showmode " Show what mode I am currently in


call plug#begin()
    Plug 'rakr/vim-one'
    Plug 'jiangmiao/auto-pairs'
    "Plug '~/.fzf' "Since I downloaded fzf using git
    "Plug 'junegunn/fzf.vim' "Fuzzy searching!
    Plug 'ctrlpvim/ctrlp.vim' " Fuzzy searching, without extra dependency
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    
    Plug 'neoclide/coc.nvim', {'branch':'release'}

call plug#end()

colorscheme one
set background=dark


" let mapleader = Set space as custom keyboard shortcut prefix
" nnoremap <leader>ps :Files
" nnoremap <C-p> :Files<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

"Vim register Ctrl/ as CTRL_
nmap <C-_> <plug>NERDCommenterToggle
imap <C-_> <C-o><plug>NERDCommenterToggle
" Visual mode as well
vmap <C-_> <plug>NERDCommenterToggle
let g:coc_disable_startup_warning = 1
highlight CocFloating ctermbg=black


" Defaults to 4000
set updatetime=300

" Tab to trigger autocomplete
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Jump to between diagnostic message
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" More mappings here: https://github.com/neoclide/coc.nvim
