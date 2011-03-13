" Pathogen calls
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Expand the history
set history=100

" Always display statusline, make it 2 lines high and set options
set ls=2
set ch=2
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" Let search wrap around document
set wrapscan

" Keep cursor 8 lines from the top or bottom
set scrolloff=8

" Allow cursor movement through empty space
set virtualedit=all

" 
set cpoptions=ces$

" Set max columns
set synmaxcol=2048

" Shows what mode I am currently in
set showmode

" 
set showcmd
set hidden

" Show line numbers
set number

" Display syntax highlighting and colorscheme
syntax on
colorscheme xoria256

" Allow backspacing over indent, eol and start of insert
set bs=2

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" Make the command-line completion better
set wildmenu

" These things start comment lines
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

"Launch file in firefox
map <F5> :!command firefox file:/%:p<CR>

" Gundo mapping
nnoremap <F7> :GundoToggle<CR>

" FTP Mappings
map ,sp :e ftp://ftp.sherlockphoto.com/

" get rid of the silly characters in window separators
set fillchars=""

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Buffer commands
noremap <silent> ,bd :bd<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>

" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
nmap <silent> ,md :!mkdir -p %:p:h<CR>
