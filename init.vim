" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ plugin boilerplate ~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
"Plug 'artanikin/vim-synthwave84'
"Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'jacoborus/tender.vim'
"Plug 'kyoz/purify', { 'rtp': 'vim' }
"Plug 'lifepillar/vim-solarized8'
"Plug 'mhartington/oceanic-next'
"Plug 'morhetz/gruvbox'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'rakr/vim-one'
"Plug 'sheerun/vim-wombat-scheme'
"Plug 'sjl/badwolf'
"Plug 'sonph/onehalf', {'rtp': 'vim/'}
"Plug 'tomasr/molokai'

" Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'dense-analysis/ale'
Plug 'HerringtonDarkholme/yats.vim'
"Plug 'honza/vim-snippets'
"Plug 'jreybert/vimagit'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
"Plug 'lukas-reineke/indent-blankline.nvim'
Plug '~/git/indent-blankline.nvim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mhinz/vim-signify' " provides +, !, _n in gutter
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'preservim/nerdcommenter'
"Plug 'preservim/nerdtree'
Plug 'rhysd/git-messenger.vim'
Plug 'shime/vim-livedown'
Plug 'SirVer/ultisnips'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'wellle/targets.vim'
Plug 'Yggdroot/indentLine'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ~~~~~~~~~~~~~~~~~~~~
" ~~~~~ UI prefs ~~~~~
" ~~~~~~~~~~~~~~~~~~~~
set background=dark
set termguicolors

" let ayucolor="dark" " light|mirage|dark
" colorscheme ayu
" colorscheme badwolf
colorscheme dracula
" colorscheme goodwolf
" colorscheme gruvbox
" colorscheme molokai
" colorscheme OceanicNext
" colorscheme one
" colorscheme onehalfdark
" colorscheme palenight
" colorscheme PaperColor
" colorscheme purify
" colorscheme solarized8_flat
" colorscheme synthwave84
" colorscheme tender
" colorscheme wombat

highlight Comment cterm=italic gui=italic
highlight Type cterm=NONE gui=NONE
highlight Keyword cterm=NONE gui=NONE
highlight DraculaPurpleItalic cterm=NONE gui=NONE

set listchars=tab:▸\ ,trail:·,eol:¬

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ sensible defaults ~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
au BufWritePre * :%s/\s\+$//e " trim whitespace from end of lines

set ignorecase
set number
set smartcase
set splitbelow
set splitright

" move virtually up and down wrapped lines, but use physical lines when used with a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" start terminal in insert mode
autocmd TermOpen term://* startinsert

" ~~~~~ tabs
set expandtab     " uses spaces instead of tabs
set shiftround    " indent to nearest tabstops
set shiftwidth=2  " amount of whitespace to add or remove using > and <
set smarttab      " backspace tabs where appropriate even though they are spaces
set softtabstop=2 " allows us to backspace over 2 spaces at a time
set tabstop=2     " specifies the width of a tab character

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ legacy muscle memory defaults ~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
map Y y$

let mapleader = ","
nmap <silent> <leader>l :set list!<CR>
nmap <silent> <leader>n :set number! \| :SignifyToggle \| :IndentLinesToggle<CR>
nmap <silent> <leader>p :set paste!<CR>
nmap <silent> <leader>v :e ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>w :set wrap!<CR>
nmap <silent> <leader>. :set nohlsearch<CR>

nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

if bufwinnr(1)
    map + :res +1<CR>
    map - :res -1<CR>

    map <leader>+ :vertical:res +1<CR>
    map <leader>- :vertical:res -1<CR>
endif

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ nvim convenience ~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if !exists('*ReloadVimrc')
  fun! ReloadVimrc()
    let save_cursor = getcurpos()
    source $MYVIMRC
    call setpos('.', save_cursor)
  endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ plugin configuration ~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ ALE
let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['rubocop']}
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'ruby': ['rubocop']}
let g:ale_fix_on_save = 0
let g:ale_set_highlights = 0
let g:ale_javascript_eslint_use_global = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
highlight clear SignColumn
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" ~~~~~ Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" ~~~~~ Coc
let g:coc_global_extensions = [
      \ 'coc-explorer',
      \ 'coc-git',
      \ 'coc-json',
      \ 'coc-tag',
      \ 'coc-ultisnips',
      \ 'coc-yank',
      \]
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nmap <silent> <leader>d :CocCommand explorer --toggle --quit-on-open<CR>

" ~~~~~ FZF
nmap <C-p> :Buffers<CR>
nnoremap ; :Buffers<CR>
nnoremap f :Files<CR>
nnoremap T :Tags<CR>
nnoremap t :BTags<CR>
nnoremap F :Ag<CR>
nnoremap H :Helptags<CR>
nnoremap L :Lines<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
let g:fzf_tags_command = 'ctags -R --exclude=node_modules --exclude=db'

" ~~~~~ git-messenger
nmap <leader>m <Plug>(git-messenger)

" ~~~~~ indentLine
let g:indentLine_char = '│'
" let g:indent_blankline_space_char = '│'
" prevent theme from over-riding Conceal colours
hi Conceal ctermfg=239 guifg=Grey30

" ~~~~~ NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
nmap <silent> <leader>, <Plug>NERDCommenterToggle
vmap <silent> <leader>, <Plug>NERDCommenterToggle

" ~~~~~ NERDTree
" let g:NERDTreeQuitOnOpen = 1
" nmap     <silent> <leader>d   :NERDTreeToggle<CR>

" ~~~~~~ UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/ultisnips']
let g:UltiSnipsExpandTrigger="<c-&>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ~~~~~ vim-fugitive
nnoremap <leader>b :Gblame<CR>

" ~~~~~ vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
let g:rspec_command = "sp | te bundle exec rspec {spec}"
