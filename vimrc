" Pathogen calls
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Don't support Vi
set nocompatible

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Expand the history
set history=100

" Sets timeout length
set timeoutlen=500

" Saves time, maps spacebar to colon
nmap <space> :

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
 
set cpoptions=cesB$
set complete=.,w,b,i,u,t

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
colorscheme xoria256

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


" Set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Set filetype stuff to on
if has("autocmd")
    filetype on
    filetype plugin on
    filetype indent on
    set ofu=syntaxcomplete#Complete

    " Language syntax fixes
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
endif

" Make the command-line completion better
set wildmenu

" Make it easier to complete buffers, open files, etc...
set wildignorecase

" get rid of the silly characters in separators
set fillchars = ""

" When completing by tag, show the whole tag, not just the function name
set showfulltag

"Autocompletion menu
" set wildmode=list:longest

set dictionary="/usr/dict/words"

" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

 " Limit popup menu height
 set pumheight=15

"Be quicker - replace : with a space
nmap <space> :

" Map Ctrl-S to save
map <c-s> :w<CR>

" Save time parsing through buffers
nmap ,bn :bn<CR>

" These things start comment lines
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

" Confim dialog
set confirm

" Turn off annoying gui options
set guioptions=ac


" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

"Plugins {

    " Supertab {
        let g:SuperTabDefaultCompletionType = "keyword"
        let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
    " }

    " Zen Coding {
        let g:user_zen_expandabbr_key = '<a-w>'
        let g:use_zen_complete_tag = 1
        let g:user_zen_next_key = '<a-l>'
        let g:user_zen_prev_key = '<a-h>'
        let g:user_zen_settings = {
            \  'indentation' : '    '
        \}
    " }
    "
    " DelimitMate {
        let delimitMate_expand_cr = 1
        map <leader>c <c-_><c-_>
    " }

    " NerdTree {
        map <F6> :NERDTreeToggle<CR>
    " }
    
    " Tagslist {
        map <F4> :TlistToggle<CR>
    " }
" }

" Custom functions ***********

" Vertical Split Buffer Function
function VerticalSplitBuffer(buffer)
    execute "vert belowright sb" a:buffer 
endfunction

"/ Keybinds ***********

"Map escape key to jj -- much faster
imap jj <esc>


"map <C-s> :w<CR>
" Vertical Split Buffer Mapping
command -nargs=1 Vbuff call VerticalSplitBuffer(<f-args>)

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>

" Gundo mapping
nnoremap <F7> :GundoToggle<CR>

" FTP Mappings
map ,sp :e ftp://ftp.sherlockphoto.com/

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

" Use space to remove annoying search highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set pt=<F6>

" fix meta-keys which generate <Esc>a .. <Esc>z
"set <M-h>=è
"imap h <M-h>
"set <M-l>=ì
"imap l <M-l>
"set <M-w>=÷
"imap w <M-w>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
" :set tags+=~/.vim/tags
nmap <silent>:W :w
