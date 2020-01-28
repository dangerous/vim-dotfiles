" .vimrc
" David Rainsford - david@rainsford.org
" http://www.rainsford.org

" use vim settings rather than vi settings
" this must be first, because it changes other options as a side effect
set nocompatible

" GENERAL SETUP
set nobackup
set formatoptions+=l
set history=50
set laststatus=2
set number
set nopaste
set pastetoggle=<F2>
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set scrolloff=5 " Keep a little buffer at the edges
set showcmd
set visualbell t_vb= " no beeps nor flashes

if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

" BEHAVIOUR
set backspace=indent,eol,start " backspace over everything
set splitbelow
set splitright

" move virtually up and down wrapped lines, but use physical lines when used
" with a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" COMPLETION
imap <Tab> <c-p>
set completeopt=longest,menuone

" SEARCH
set hlsearch
set ignorecase
set incsearch
set smartcase " ignorecase unless search contains an uppercase letter

" TABBING
set expandtab     " uses spaces instead of tabs
set listchars=tab:▸\ ,eol:¬
set shiftround    " indent to nearest tabstops
set shiftwidth=2  " amount of whitespace to add or remove using > and <
set smarttab      " backspace tabs where appropriate even though they are spaces
set softtabstop=2 " allows us to backspace over 2 spaces at a time
set tabstop=2     " specifies the width of a tab character

if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Delete autocommands that have already been set
    " I found that if I don't have this then repeatedly saving / reloading
    " gets slower and slower because it is doing all the autocmd stuff
    " several times
    au!

    " Set tab to 2 spaces
    au FileType html,css,xml setlocal ts=2 sts=2 sw=2

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    au BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \ exe "normal! g`\"" |
                \ endif

    au WinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline

    au BufWritePre * :%s/\s\+$//e

    au bufwritepost .vimrc source ~/.vimrc
    "au bufwritepost .vimrc call Pl#Load()
else
    set autoindent " always set autoindenting on
endif

" shortcuts
cmap w!! %!sudo tee > /dev/null %

map Y y$
noremap H ^
noremap L $

let mapleader = ","

nmap     <silent> <leader>d   :NERDTreeToggle<CR>
"nmap     <silent> <leader>l   :set list!<CR>
nmap     <silent> <leader>n   :set nu!<CR>
nmap     <silent> <leader>p   :set paste!<CR>
nmap              <leader>v   :e $MYVIMRC<CR> " easy .vimrc editing
nmap     <silent> <leader>w   :set wrap!<CR>
nmap     <silent> <leader>.   :nohlsearch<CR>
vmap              <leader>j !python -m json.tool

nmap <F8> :TagbarOpenAutoClose<CR>

" Move visual selection around
vmap <C-h> x<BS>P`[v`]
vmap <C-j> xp`[V`]
vmap <C-k> xkP`[V`]
vmap <C-l> x<Space>P`[v`]

" Smart way to move windows
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" Move around buffers
nmap ˙ :bprevious<CR>
nmap ¬ :bnext<CR>

if bufwinnr(1)
    map + :res +1<CR>
    map - :res -1<CR>
    map <leader>+ :vertical:res +1<CR>
    map <leader>- :vertical:res -1<CR>
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" plugins

let g:NERDTreeQuitOnOpen = 1

syntax enable
set t_Co=256
set background=dark
"colorscheme solarized
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic
"highlight Type cterm=italic
"highlight PreProc cterm=italic

" Ctrl-P plugin
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](\.git|tmp|node_modules)$'
let g:ctrlp_max_files=100000

" Airline plugin
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme_patch_func = 'AirlineThemePatch'
let g:airline#extensions#tabline#buffer_nr_show = 1

" Color of inactive statusbar text
function! AirlineThemePatch(palette)
  if g:airline_theme == 'solarized'
    for colors in values(a:palette.inactive)
      let colors[2] = 220
    endfor
  endif
endfunction

" ALE
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'ruby': ['rubocop']}
let g:ale_fix_on_save = 0
let g:ale_set_highlights = 0
let g:ale_javascript_eslint_use_global = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
highlight clear SignColumn
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
nmap <silent> <leader>, <Plug>NERDCommenterToggle
vmap <silent> <leader>, <Plug>NERDCommenterToggle

" Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" vim-json
let g:vim_json_syntax_conceal = 0

" ack.vim
let g:ack_autoclose = 1
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vim-rspec
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>a :call RunAllSpecs()<CR>

runtime macros/matchit.vim
