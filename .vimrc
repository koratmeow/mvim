"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintained by: 
" https://github.com/koratmeow
" 12/19/2019
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use ':verbose map <key>' to check key mappings.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" specify plugin folder
" has("gtk2") || has("gtk3")
" has("macvim")
" if has("win32")
if has("macvim")
  call plug#begin('/Users/RZY/vimfiles/bundle')
else
  call plug#begin('~/.vim/bundle')
endif

" style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'

" tl;dr
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

" py
"Plug 'Vimjas/vim-python-pep8-indent', {'for':'py'}
"Plug 'jeetsukumaran/vim-pythonsense', {'for':'py'}
"Plug 'jiangmiao/auto-pairs', {'for':'py'}
"Plug 'dense-analysis/ale', {'for':'py'}
"Plug 'sheerun/vim-polyglot', {'for':'py'}

" sv
" Plug 'yggdroot/indentLine'
" Plug 'nachumk/systemverilog.vim'
" Plug 'vhda/verilog_systemverilog.vim'
Plug 'lifepillar/vim-mucomplete'

" lists of plugins
" Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/nerdcommenter' 
" Plug 'junegunn/goyo.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" define leader
let mapleader = ";"
let localleader = "-"

" yank to windows clipboard 
set clipboard=unnamed

" Enable filetype detect 
filetype on
" Enable filetype plugins
filetype plugin indent on

" Sets how many lines of history VIM has to remember
set history=500

" Set to autoread when a file is changed from the outside
set autoread

" Fast saving
nnoremap <leader>w :w!<cr>

" Vimrc open
nnoremap <leader>ev :split $MYVIMRC<cr>

" Split control
set splitbelow
set splitright
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline
" set cursorcolumn

" Turn on the Wild menu
set wildmenu

" Show command and match
set showcmd
set showmatch

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" When searching try to be smart about cases 
set smartcase

" Makes search act like search in modern browsers
set incsearch 
set ignorecase

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 
syntax on

let base16colorspace=256

try
  colo onedark
catch /^Vim\%((\a\+))\=:E185/
  colo dessert
endtry

" Highlight search results
set hlsearch
"Always show current position
set ruler
"display number on the left
set nu
" Height of the command bar
set cmdheight=2
" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Set extra options when running in GUI mode
" if has('gui_running')
"     if has('gui_win32')
"       set guifont=Consolas:h11:cANSI
"     elseif has('gui_macvim')
"         set guifont=Monaco:h13
"     elseif has('gui_gtk2')|| has('gui_gtk3')
"         set guifont=Monospace\ 12
"     endif
"     set sm
"     set showmatch
"     set matchtime=5
" " disable cursor blinking
"     set gcr=a:block-blinkon0 
" " disable menu
" "   set guioptions-=m
" " disable toolbar
"     set guioptions-=T
" " disable tab bar
"     "set guioptions-=e
" " disable roll bar
"     set guioptions-=l
"     set guioptions-=L
"     set guioptions-=r
"     set guioptions-=R
"     
"     set t_Co=256
"     set guitablabel=%M\ %t
" endif

"" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
"
"" Use Unix as the standard file type
set ffs=unix,dos,mac
"
"" Set color theme for systemverilog
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent on

" Use spaces instead of tabs
set expandtab
" 1 tab = 2 space , when editing
set tabstop=2
" 1 tab = 2 space , when saving
set shiftwidth=2
" 1 tab = 2 space , when deleting
set softtabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
"set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => indent folding
""""""""""""""""""""""""""""""
set fdm=syntax
set foldlevel=99
nnoremap <space> za

""""""""""""""""""""""""""""""
" => Visual Mode Map 
""""""""""""""""""""""""""""""
" Visual mode pressing f for / search
vnoremap <silent> f :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
noremap <silent> <C-j> <C-W><C-j>
noremap <silent> <C-k> <C-W><C-k>
noremap <silent> <C-h> <C-W><C-h>
noremap <silent> <C-l> <C-W><C-l>

" Close the current buffer
noremap <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
noremap <leader>ba :bufdo bd<cr>
noremap <leader>l :bnext<cr>
noremap <leader>h :bprevious<cr>

" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove 
noremap <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nnoremap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
noremap <leader>l ^
noremap <leader>' $

" Delete trailing white space on save
" fun! CleanExtraSpaces()
"     let save_cursor = getpos(".")
"     let old_query = getreg('/')
"     silent! %s/\s\+$//e
"     call setpos('.', save_cursor)
"     call setreg('/', old_query)
" endfun
" 
" if has("autocmd")
"     autocmd BufWritePre *.txt,*.js,*.py,*.md,*.sh,*.sv :call CleanExtraSpaces()
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
noremap <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
noremap <leader>x :e ~/buffer.md<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" indent guide
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" mucomplete 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Mandatory vim setting for MUComplete
"" 1. longest
"" 2. menuone
"" 3. noselect(vim 7.4.775 or later)
" 
"set completeopt-=preview
"set completeopt+=menuone
"set completeopt+=noselect
"    
"" shorten completion message
"set shortmess+=c
"
"let g:mucomplete#enable_auto_at_startup = 1
"let g:mucomplete#completion_delay = 0
"nnoremap <leader>a :MUcompleteAutoToggle<CR>
"let g:MUcompleteNotify = 0 
"" inoremap <silent> <expr> <cr> mucomplete#ultisnipsi#expand_snippet("\<cr>")
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline_theme='luna'

" instant vimrc change 
autocmd BufWritePost $MYVIMRC source $MYVIMRC


