" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ plugin boilerplate ~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
Plug 'aklt/plantuml-syntax' " PlantUML
Plug 'alvan/vim-closetag' " Auto close (X)HTML tags
Plug 'AndrewRadev/splitjoin.vim' " Switch between single-line and multiline forms of code [gS / gJ]
Plug 'cespare/vim-toml', { 'branch': 'main' } " Vim syntax for TOML
Plug 'crusoexia/vim-monokai' " Monokai color scheme
Plug 'dense-analysis/ale' " Asynchronous Lint Engine
Plug 'HerringtonDarkholme/yats.vim' " typescript highlighting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " a general-purpose command-line fuzzy finder
Plug 'junegunn/fzf.vim' " a bundle of fzf-based commands and mappings
Plug 'MaxMEllon/vim-jsx-pretty' " The React syntax highlighting and indenting plugin for vim
Plug 'mhinz/vim-signify' " provides +, !, _n in gutter
Plug 'mracos/mermaid.vim', {'branch': 'main'} " provides support to mermaid syntax files
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine
Plug 'pangloss/vim-javascript' " syntax highlighting and improved indentation
Plug 'preservim/nerdcommenter' " intensely nerdy commenting powers
Plug 'preservim/nerdtree' " file system explorer
Plug 'rhysd/git-messenger.vim' " quickly reveal the hidden message from Git under the cursor [<leader>gm]
Plug 'rstacruz/vim-closer' " Closes brackets
Plug 'slim-template/vim-slim' " Slim syntax highlighting
Plug 'thoughtbot/vim-rspec' " lightweight RSpec runner [<leader>t (/s/l/a)]
Plug 'tpope/vim-endwise' " wisely add `end` in ruby
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-rhubarb' " GitHub extension for fugitive.vim [adds :GBrowse]
Plug 'tpope/vim-sensible' " Defaults everyone can agree on
Plug 'tpope/vim-surround' " all about surroundings; parentheses, brackets, quotes, XML tags, and more
Plug 'vim-ruby/vim-ruby' " Vim/Ruby Configuration Files
Plug 'vim-airline/vim-airline'
Plug 'wellle/targets.vim' " adds various text objects to give you more targets to operate on
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ~~~~~~~~~~~~~~~~~~~~
" ~~~~~ UI prefs ~~~~~
" ~~~~~~~~~~~~~~~~~~~~
set background=dark
set linebreak
set termguicolors

colorscheme monokai

highlight Comment cterm=italic gui=italic
highlight Type cterm=NONE gui=NONE
highlight Keyword cterm=NONE gui=NONE
highlight DraculaPurpleItalic cterm=NONE gui=NONE

set fillchars+=vert:\▏
set listchars=tab:▸\ ,trail:·,eol:¬

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ sensible defaults ~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
au BufWritePre * :%s/\s\+$//e " trim whitespace from end of lines

set conceallevel=2 " something to do with json not sure the plugin
set ignorecase
set mouse=
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
" ~~~~~ airline
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.notexists = '∄'

" ~~~~~ ALE
"let g:ale_change_sign_column_color = 1
let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['rubocop'], 'CloudFormation': ['cfn-lint']}
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
      \ 'coc-json',
      \]

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" ~~~~~ FZF
nmap <C-p> :Buffers<CR>
nnoremap f :Files<CR>
nnoremap F :Ag<CR>
nnoremap L :Lines<CR>
hi! FZF guifg=#FF0000 guibg=NONE ctermbg=NONE ctermfg=NONE
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp', 'highlight': 'FZF' } }
let $FZF_DEFAULT_COMMAND='ag --hidden -p ~/.gitignore -g ""'
let $FZF_DEFAULT_OPTS='--reverse'

" ~~~~~ git-messenger
nmap <leader>m <Plug>(git-messenger)

" ~~~~~ NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
nmap <silent> <leader>, <Plug>NERDCommenterToggle
vmap <silent> <leader>, <Plug>NERDCommenterToggle

" ~~~~~ NERDTree
let g:NERDTreeQuitOnOpen = 1
nmap     <silent> <leader>d   :NERDTreeToggle<CR>

" ~~~~~ plantuml-syntax
autocmd FileType plantuml call FT_plantuml()
function FT_plantuml()
  nnoremap <F5> :w<CR> :silent make<CR>
  inoremap <F5> <Esc>:w<CR>:silent make<CR>
  vnoremap <F5> :<C-U>:w<CR>:silent make<CR
endfunction

" ~~~~~ python3 provider
let g:python3_host_prog="/usr/local/bin/python3"

" ~~~~~ vim-fugitive
nnoremap <leader>b :Git blame<CR>
nnoremap <leader>gb :GBranches<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

" ~~~~~ vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
let g:rspec_command = "sp | te bundle exec rspec {spec}"
