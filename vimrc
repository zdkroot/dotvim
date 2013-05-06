"       Zack Kismarton          |
"           .vimrc v0.04        |
" Tue Apr  2 12:20:28 EDT 2013  |
"                               |
" Changelog:                    |
"   turned off relative number  |
"   adding binding to show      |
"       invisibles              |
"   fixed compile binding       |
" ------------------------------

" Pathogen calls
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Don't support Vi
set nocompatible

" ---UNIX ONLY---
if has("unix")

    " Inserts the date below the cursor
    nmap <F8> :r!date<Cr>kJ

    " Make the command-line completion better
    set wildmenu

    " Make it easier to complete buffers, open files, etc...
    " set wildignorecase --not a real command?

    " Autocompletion menu
    set wildmode=list:longest


    nmap <A-F9> :!%:p:r<CR>

endif
" ---END UNIX ONLY---

" Sets '+' to be the be the copy to clipboard register. +y, +dd, etc.
" set clipboard=unnamedplus

" Start in home folder always
" cd ~
nnoremap <Leader>sh :sh<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" set the forward slash to be the slash of note. Backslashes suck
set shellslash

" Expand the history
set history=100

" Sets timeout length
set timeoutlen=500

" Turn off visual or audio bell
set noeb vb t_vb=

" Always display 2 line statusline, set options
set ls=2
set ch=2
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" Let search wrap around document
set wrapscan

" Enable search highlighting
set hlsearch

set incsearch

" Keep cursor 8 lines from the top or bottom
set scrolloff=8

" Allow cursor movement through empty space
set virtualedit=all
 
set cpoptions=cesB$
set complete=.,w,i,b,t

" Set max columns
set synmaxcol=2048

" Shows what mode I am currently in
set showmode

set showcmd
set hidden

" Show line numbers
set number

" Display syntax highlighting and colorscheme
syntax on
set t_Co=256
colorscheme blackboard

" Allow backspacing over indent, eol and start of insert
set bs=2

" Tabstops are 4 spaces, replace tabs with spaces.
set ts=4
set sts=4
set sw=4
set expandtab
set autoindent
set smartindent
set copyindent

" Stop Vim making back up files
set nobackup
set noswapfile

let mapleader = ","

" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Set filetype stuff to on
if has("autocmd")
    filetype on
    filetype plugin on
    filetype indent on

    " Language syntax fixes
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType c setlocal nmap <C-F9> :!gcc -std=c99 -o %:r %<CR>
    autocmd FileType cpp setlocal nmap <C-F9> :!g++ -o %:r %<CR>
endif

" get rid of the silly characters in separators
set fillchars = ""

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" set dictionary="/usr/dict/words"

 " Limit popup menu height
 set pumheight=15

" These things start comment lines
" set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

" Confim dialog
" set confirm

" Turn off annoying gui options
set guioptions=acg

" Linux and windows font options.
" set guifont=Consolas:h11:cANSI

set tw=110
set fo=cqt
set wm=0

" set text wrapping toggles
nmap <silent> ,ww :set invwrap<CR>:set wrap?<CR>

" Default to nowrap
set nowrap

"Map escape key to jj -- much faster
imap jj <esc>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" :set tags+=~/.vim/tags
nmap <silent>:W :w
nmap <silent>:Q :q

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Gundo mapping
nnoremap <F9> :GundoToggle<CR>
" Buffer commands
noremap <silent> ,bd :bd<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>

" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
nmap <silent> ,md :!mkdir %:p:h<CR>

" Use space to remove annoying search highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" easier window navigation
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

" Doesn't work? Why commented out?
" Fix meta-keys which generate <Esc>a .. <Esc>z
"set <M-h>=è
"imap h <M-h>
"set <M-l>=ì
"imap l <M-l>
"set <M-w>=÷
"imap w <M-w>

" Map Ctrl-S to save
map <c-s> :w<CR>

" Save time parsing through buffers
nmap ,bn :bn<CR>
nmap ,bv :bp<CR>

nmap <silent> <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>



" Plugins {

" NerdTree {
map <F5> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1


" Tagslist {
map <F6> :TlistToggle<CR>




" XPT-Templates settings
let g:xptemplate_brace_complete = 1
"
" Remove spaces between braces
let g:xptemplate_vars = "SParg="
"
" Snippet triggering key:
let g:xptemplate_key = '<Tab>'
"
" Open the pop-up menu:
let g:xptemplate_key_pum_only = '<Leader><Tab>'
"
" Clear current placeholder and jump to the next:
"imap <C-d> <Tab>
let g:xptemplate_nav_cancel = '<C-d>'
"
" Move to the next placeholder in a snippet:
let g:xptemplate_nav_next = '<Tab>'
"
" Go to the end of the current placeholder and in to insert mode:
" <C-_> is actually CONTROL-/ on my keyboard.
let g:xptemplate_to_right = '<C-_>'
"
" Move cursor back to last placeholder:
let g:xptemplate_goback = '<C-g>'
"
" Use TAB/S-TAB to navigate through the pop-up menu:
let g:xptemplate_pum_tab_nav = 1
"
" Reload xptemplate snippets without quitting vim.
nmap <A-F1> :XPTreload<CR>


" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


"helpeful abbreviations
iab lorem lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
