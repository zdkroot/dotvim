"Custom settings
set history=100
set ls=2
set ch=2
set wrapscan
set scrolloff=8
set virtualedit=all
set cpoptions=ces$
set synmaxcol=2048
let loaded_matchparen = 1
set showmode
set showcmd
set lazyredraw
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]
set hidden
set number

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4

"Set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Set filetype stuff to on
filetype on

" Make the command-line completion better
set wildmenu

" These things start comment lines
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

"Launch file in firefox
map <F5> :!command firefox file:/%:p<CR>
