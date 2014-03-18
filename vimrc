" Zack Kismarton                |
" .vimrc v0.10                  |
" Tue Mar 18 15:59:10 EDT 2014  |
"                               |
" Changelog:                    |
" Re-organized!
" Solarized colorscheme         |
" Switched pathogen for vundle  |
" Turned off relative number    |
" Adding binding to show        |
" Invisibles                    |
" Fixed compile binding         |
" ------------------------------

" Don't support Vi
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-speeddating'
Bundle 'majutsushi/tagbar'
Bundle 'SirVer/UltiSnips'
Bundle 'honza/vim-snippets'
Bundle 'tobyS/pdv'
Bundle 'tobyS/vmustache'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'JazzCore/neocomplcache-ultisnips'
Bundle 'lfilho/cosco.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'joonty/vdebug'
Bundle 'Align'
Bundle 'closetag.vim'
Bundle 'bufkill.vim'

" ---UNIX ONLY---
if has("unix")

set wildmenu " Make the command-line completion better
set wildmode=longest:full,full " Autocompletion menu
set wildignorecase " Make it easier to complete buffers, open files, etc...
nmap <F8> :r!date<Cr> " Inserts the date below the cursor
nmap <A-F9> :!%:p:r<CR> " Run the current file in the shell
" nmap <c-t> :r!mysql -uroot -p -e 'SELECT DISTINCT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = "users_residents_pg"'<Cr>

endif
" ---END UNIX ONLY---

" ---AUTOCMD---
if has("autocmd")
filetype on " Set filetype stuff to on
filetype plugin on
filetype indent on

" Language syntax fixes
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType cpp nmap <C-F9> :!clang -x c++ -arch x86_64 -std=gnu++11 -stdlib=libc++ -o %:r %<CR>
    " autocmd FileType cpp nmap <C-F9> :!g++ -o %:r %<CR>
    autocmd FileType c nmap <C-F9> :!gcc -std=c99 -o %:r %<CR>
    autocmd FileType javascript,css,php nmap <silent> <leader>; :call cosco#commaOrSemiColon()<CR>
    autocmd FileType javascript,css,php inoremap <silent> <leader>; <ESC>:call cosco#commaOrSemiColon()"<CR>a
    au BufNewFile,BufRead *.mh set ft=php
    autocmd FileType php setlocal ts=3 sts=3 sw=3 noexpandtab
endif
" --- END AUTOCMD ---

" Settings
" ========================================

" set clipboard=unnamedplus " Sets '+' to be the be the copy to clipboard register. +y, +dd, etc.
set listchars=tab:▸\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs
set shellslash " set the forward slash to be the slash of note. Backslashes suck
set history=100 " Expand the history
set timeoutlen=500 " Sets timeout length
set noeb vb t_vb= " Turn off visual or audio bell
set wrapscan " Let search wrap around document
set hlsearch " Enable search highlighting
set ignorecase " Set the search scan so that it ignores case when the search is all lower case but recognizes uppercase if it's specified
set scrolloff=8 " Keep cursor 8 lines from the top or bottom
set virtualedit=all " Allow cursor movement through empty space
set synmaxcol=2048 " Set max columns
set showmode " Shows what mode I am currently in
set fillchars = "" " get rid of the silly characters in separators
set showfulltag " When completing by tag, show the whole tag, not just the function name
set pumheight=15 " Limit popup menu height
set number " Show line numbers
set bs=2 " Allow backspacing over indent, eol and start of insert
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:- " These things start comment lines
set guioptions=acg " Turn off annoying gui options
set tw=110 " Textwidth
set hidden
set incsearch
set smartcase
set cpoptions=cesB$
set complete=.,w,i,b,t
set nobackup
set noswapfile
set fo=cqt
set wm=0

" Tabstops are 4 spaces, replace tabs with spaces.
set ts=4
set sts=4
set sw=4
set expandtab
set autoindent
set smartindent
set copyindent
set nowrap " Default to nowrap
set tags=./tags;/

" Disabled for powerline
" set ls=2
" set ch=2
" set showcmd
" set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B] " Always display 2 line statusline, set options

" Display syntax highlighting and colorscheme
syntax on
set t_Co=256
set background=dark
colorscheme solarized

" Binds
" ========================================
let mapleader = ","
nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list` " Toggle invis characters
nmap <silent> ,ww :set invwrap<CR>:set wrap?<CR> " Toggle text wrapping
omap <silent> <leader>/ :Align => = \* /<CR>
vmap <silent> <leader>/ :Align => = \* /<CR>
omap <silent> // :TCommentBlock<CR>
vmap <silent> // :TCommentBlock<CR>
nmap <silent> // :TComment<CR>
imap jj <esc> "Map escape key to jj -- much faster
cmap w!! w !sudo tee % >/dev/null " For when you forget to sudo..
nmap <silent> ,ev :e $MYVIMRC<CR> " Edit the vimrc file
nmap <silent> ,sv :so $MYVIMRC<CR> " Source my vimrc
nmap <silent> ,cd :lcd %:h<CR> " cd to the directory containing the file in the buffer
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> " Use space to remove annoying search highlighting
nmap <silent> ,p :set invpaste<CR>:set paste?<CR> " Toggle paste mode
map <c-s> :w<CR> " Map Ctrl-S to save
nmap <silent> ,md :!mkdir %:p:h<CR> " Make the directory that contains the file in the current buffer.
" Lower my blood pressure
nmap <silent>:W :w
nmap <silent>:Q :q
" easier window navigation
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh
" Save time parsing through buffers
nmap ,bn :bn<CR>
nmap ,bv :bp<CR>
" returns the syntax highlighting group that the current "thing" under the cursor belongs to
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Plugins
" ========================================

" Powerline
let g:Powerline_symbols = 'fancy'

" NerdTree
nnoremap <silent> <leader>kb :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1

" Ctrl-P
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:5,results:10'

" Tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<s-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" PDV
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <silent> <leader>d :call pdv#DocumentWithSnip()<CR>

" Neocomplcache.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Gundo
nnoremap <F9> :GundoToggle<CR>

" Bufkill
noremap <silent> ,bd :BD<CR>

" Helpeful abbreviations
iab lorem lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
