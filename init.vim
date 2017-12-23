"
"
" " Use vim instead of vi (ignored by nvim)
" set nocompatible  " be iMproved, required
"
"
" "--------------------------------------
" " Set visual aspects
" "--------------------------------------
" " Colours
" " Set to 256 terminal color mode
" set t_Co=256  " Note: Neovim ignores t_Co and other terminal codes.
"
" " Neovim true color
" if has('nvim-0.1.5')  " True color in neovim wasn't added until 0.1.5
"     set termguicolors
" endif
"
" " Enable syntax highlighting
" syntax enable
"
" try
"     colorscheme solarized
" catch
" endtry
"
" set background=dark
"
"
" "--------------------------------------
" " Character sets
" "--------------------------------------
" " Set utf8 as standard encoding and en_US as the standard language
" set encoding=utf8
"
" " Use Unix as the standard file type (has effect on line ending characters)
" set ffs=unix,dos,mac
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Turn backup off, since most stuff is in SVN, git et.c anyway...
" set nobackup
" set nowb
" set noswapfile
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Text, tab and indent related
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Use spaces instead of tabs
" set expandtab
"
" " Be smart when using tabs ;)
" set smarttab
"
" " 1 tab == 4 spaces
" set shiftwidth=4
" set tabstop=4
"
" " Linebreak on 500 characters
" set lbr
" set tw=500
"
" set ai "Auto indent
" set si "Smart indent
" set wrap "Wrap lines
"
"
"
"
"
" " Highlight current line
" set cursorline
" " Enable line numbers
" set number
" " Show the cursor position
" set ruler
" " Show the current mode
" set showmode
" " Show the filename in the window titlebar
" set title
" " Set linenumbers
" set number
" " enable mouse
" set mouse=a
"
" " ensures that statusline shows up even if you don’t have any split
" set laststatus=2
