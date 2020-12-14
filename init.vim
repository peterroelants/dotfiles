"--------------------------------------
" Plugin section
"--------------------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'

Plug 'preservim/nerdcommenter'

Plug 'preservim/nerdtree'

call plug#end()


"--------------------------------------
" Config section
"--------------------------------------
"--------------------------------------
" Set visual aspects
"--------------------------------------
syntax enable  " Set colorsheme

let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
set t_Co=256
let g:gruvbox_termcolors = 256

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

"--------------------------------------
" Character sets
"--------------------------------------
" Set utf8 as standard encoding
set fileencoding=utf-8
set encoding=utf-8

"--------------------------------------
" Text, tab and indent related
"--------------------------------------
filetype plugin indent on  " Smart indent
set tabstop=2  " tap spaces width
set shiftwidth=2  " tab spaces when indenting with '>'
set expandtab  " On pressing tab, insert spaces
set showmatch  " Match parentheses
set autoindent  " Auto indentation

"--------------------------------------
" Line numbers and status bar
"--------------------------------------
set cursorline  " Highlight current line
set number  " Enable line numbers
set ruler  " Show the cursor position
set showmode  " Show the current mode
set title  " Show the filename in the window titlebar

set laststatus=2  " ensures that statusline shows up even if you don’t have any split

"--------------------------------------
" Mouse and clipboard interaction
"--------------------------------------
set mouse=a  " enable mouse
set clipboard+=unnamedplus " Use the default `+` register which is linked to the system clipboard

"--------------------------------------
" keyboard remaps
"--------------------------------------
" Search
nnoremap <esc><esc> :noh<return>  " Clear highlights on hitting ESC twice

" Navigating windows
" Remap Control + movement to not need `w`
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

"--------------------------------------
" NERDTree config
"--------------------------------------
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>  " Open NERDTree
let NERDTreeMinimalUI=1  " remove the "Press ? for help" at the top of NERDTree
let NERDTreeIgnore=['\.DS_Store$', '\.vim$']  " Files to ignore by NERDTree
" Open NERDTree automatically when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Use Tab and Shift-Tab to cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"--------------------------------------
" NERDCommenter config
"--------------------------------------
" Ctrl-/ for comment untoggle (For some reason, vim registers <C-/> as <C-_>)
" https://stackoverflow.com/a/9051932/919431
nmap <C-_> <plug>NERDCommenterToggle

