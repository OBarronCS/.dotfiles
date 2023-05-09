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
set ttymouse=sgr " Make mouse work correctly in tmux. xterm2 also works
set termguicolors " Makes colors work in tmux


set tabstop=4 " Spaces in a tab
set shiftwidth=4 " Spaces in an indent, helps with autoindent
set softtabstop=4 " 
set expandtab " Uses spaces even when tabbing
set nowrap " No line wrapper

set smartindent "C style indentation

set ignorecase " Ignore case when searching
set smartcase " If searching for capitals, include only capitals 
set showmatch " Show matching words during search
" set hlsearch " Highlighting during search
set incsearch
set nohlsearch " After search, stop highlighting

set scrolloff=8

" set nohlsearch " Disable the highlighting after done searching

set hidden " Keep extra buffer of save state, hides files instead of closes it

set signcolumn=yes
set cmdheight=2

set showmode " Show what mode I am currently in

call plug#begin()
    Plug 'jiangmiao/auto-pairs'
    Plug '~/.fzf' "Since I downloaded fzf using git
    Plug 'junegunn/fzf.vim' "Fuzzy searching!
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'vim-airline/vim-airline' 
    " Telescope, treesitter, harpoon, nvim commenter, nvim cmp
call plug#end()
"let g:airline#extensions#tabline#enabled = 1
set background=dark
"hi Normal guibg=NONE ctermbg=NONE

let mapleader = " " "Set space as custom keyboard shortcut prefix
nnoremap <leader>pv :Ex<CR>
nnoremap <C-p> :Files<CR>
map <C-F> :Lines<CR>

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <C-n> :NERDTreeToggle<CR>

" Comment empty lines
let g:NERDCommentEmptyLines = 1

"Vim register Ctrl/ as CTRL_
vmap <C-/> <plug>NERDCommenterToggle

nmap <C-_> <plug>NERDCommenterToggle
nmap <C-/> <plug>NERDCommenterToggle

imap <C-_> <C-o><plug>NERDCommenterToggle
imap <C-/> <C-o><plug>NERDCommenterToggle

" Visual mode as well
vmap <C-_> <plug>NERDCommenterToggle

" Defaults to 4000
set updatetime=300

