" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ plugin boilerplate ~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.

Plug 'tpope/vim-sensible' " Defaults everyone can agree on

" ~~~ Language Support
Plug 'aklt/plantuml-syntax' " PlantUML
Plug 'alvan/vim-closetag' " Auto close (X)HTML tags
Plug 'cespare/vim-toml', { 'branch': 'main' } " Vim syntax for TOML
Plug 'ekalinin/Dockerfile.vim' " Vim syntax file & snippets for Docker's Dockerfile
Plug 'HerringtonDarkholme/yats.vim' " typescript highlighting
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'} " Instant Markdown previews from Vim
Plug 'keith/rspec.vim' " Better rspec syntax highlighting for Vim
Plug 'MaxMEllon/vim-jsx-pretty' " The React syntax highlighting and indenting plugin for vim
Plug 'mracos/mermaid.vim', {'branch': 'main'} " provides support to mermaid syntax files
Plug 'pangloss/vim-javascript' " syntax highlighting and improved indentation
Plug 'slim-template/vim-slim' " Slim syntax highlighting
Plug 'thoughtbot/vim-rspec' " lightweight RSpec runner [<leader>t (/s/l/a)]
Plug 'tpope/vim-endwise' " wisely add `end` in ruby
Plug 'tpope/vim-surround' " all about surroundings; parentheses, brackets, quotes, XML tags, and more
Plug 'vim-ruby/vim-ruby' " Vim/Ruby Configuration Files
Plug 'vim-python/python-syntax' " Python syntax highlighting for Vim

" ~~~ Code Linting

" ~~~ Code Completion
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine
" let g:ruby_host_prog = '/Users/david/.asdf/shims/ruby'
" Plug 'github/copilot.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" ~~~ Code Candy
Plug 'rstacruz/vim-closer' " Closes brackets
Plug 'tomtom/tcomment_vim' "  An extensible & universal comment vim-plugin that also handles embedded filetypes

" ~~~ git cleverness
Plug 'mhinz/vim-signify' " provides +, !, _n in gutter
Plug 'rhysd/git-messenger.vim' " quickly reveal the hidden message from Git under the cursor [<leader>gm]
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-rhubarb' " GitHub extension for fugitive.vim [adds :GBrowse]

" ~~~ text objects
Plug 'wellle/targets.vim' " adds various text objects to give you more targets to operate on

" ~~~ Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " a general-purpose command-line fuzzy finder
Plug 'junegunn/fzf.vim' " a bundle of fzf-based commands and mappings
Plug 'preservim/nerdtree' " file system explorer

" ~~~ Beautiful vim
" Plug 'ap/vim-buftabline' " Forget Vim tabs – now you can have buffer tabs
Plug 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
"
" ~~~ Color schemes
" Plug 'sonph/onehalf', { 'rtp': 'vim' } " Clean, vibrant and pleasing color schemes for Vim, Sublime Text, iTerm, gnome-terminal and more.

" DISABLED

" ~~~ Language Support
" ~~~ Code Linting
" Plug 'dense-analysis/ale' " Asynchronous Lint Engine
" ~~~ Code Completion
" ~~~ Code Candy
" Plug 'AndrewRadev/splitjoin.vim' " Switch between single-line and multiline forms of code [gS / gJ]
" Plug 'preservim/nerdcommenter' " intensely nerdy commenting powers
" Plug 'tpope/vim-commentary' " commentary.vim: comment stuff out
" ~~~ git cleverness
" ~~~ text objects
" Plug 'kana/vim-textobj-user' " Vim plugin: Create your own text objects
" Plug 'kana/vim-textobj-entire' " Vim plugin: Text objects for entire buffer
" ~~~ Navigation
" ~~~ Beautiful vim
" ~~~ Color schemes
Plug 'crusoexia/vim-monokai' " Monokai color scheme
Plug 'dracula/vim' " The most famous dark theme ever created and available everywhere!
Plug 'joshdick/onedark.vim' " A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ~~~~~~~~~~~~~~~~~~~~
" ~~~~~ UI prefs ~~~~~
" ~~~~~~~~~~~~~~~~~~~~
set background=dark
set linebreak
set termguicolors

let g:airline_theme='dracula'
let g:dracula_italic = 0
colorscheme dracula
highlight DraculaComment cterm=italic gui=italic guifg=#cccccc
highlight ErrorMsg guibg=#FFB86C guifg=#000000

" highlight Keyword cterm=NONE gui=NONE
" highlight DraculaPurpleItalic cterm=NONE gui=NONE

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
" set relativenumber
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

" " highlight current line as a way to see what split I am in
" augroup BgHighlight
"   autocmd!
"   autocmd WinEnter * set cul
"   autocmd WinLeave * set nocul
" augroup END

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ legacy muscle memory defaults ~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
map Y y$

let mapleader = ","
nmap <silent> <leader>l :set list!<CR>
nmap <silent> <leader>n :set number! \| :set relativenumber! \| :SignifyToggle \| :IndentLinesToggle<CR>
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
" :help airline-tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1

" ~~~~~ ALE
let g:ale_change_sign_column_color = 0
" let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['rubocop'], 'CloudFormation': ['cfn-lint'], 'eruby': ['erblint']}
let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['rubocop'], 'CloudFormation': ['cfn-lint'], 'eruby': ['erblint']}
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'ruby': ['rubocop']}
let g:ale_fix_on_save = 0
let g:ale_set_highlights = 0
let g:ale_javascript_eslint_use_global = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
highlight clear SignColumn
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" move between buffers, this should go somewhere else
set hidden
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-P> :bprev<CR>

" ~~~~~ Closetag
let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"
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

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" ~~~~~ FZF
" nmap <C-p> :Buffers<CR>
nnoremap f :Files<CR>
nnoremap F :Ag<CR>
" nnoremap <C-f> :Files<CR>
" nnoremap <C-a> :Ag<CR>
" nnoremap <C-p> :FZF<CR>
nnoremap L :Lines<CR>
hi! FZF guifg=#FF0000 guibg=NONE ctermbg=NONE ctermfg=NONE
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp', 'highlight': 'FZF' } }
let $FZF_DEFAULT_COMMAND='ag --hidden -p ~/.gitignore -g ""'
let $FZF_DEFAULT_OPTS='--reverse'

" ~~~~~ git-messenger
nmap <leader>m <Plug>(git-messenger)

" ~~~~~ NERDCommenter
" let g:NERDSpaceDelims = 1
" let g:NERDCommentEmptyLines = 1
" nmap <silent> <leader>, <Plug>NERDCommenterToggle
" vmap <silent> <leader>, <Plug>NERDCommenterToggle

" ~~~~~ NERDTree
let g:NERDTreeQuitOnOpen = 1
nmap <silent> <leader>d :NERDTreeToggle<CR>

" ~~~~~ plantuml-syntax
autocmd FileType plantuml call FT_plantuml()
function FT_plantuml()
  nnoremap <F5> :w<CR> :silent make<CR>
  inoremap <F5> <Esc>:w<CR>:silent make<CR>
  vnoremap <F5> :<C-U>:w<CR>:silent make<CR
endfunction

" ~~~~~ python3 provider
let g:python3_host_prog="/usr/local/bin/python3"

" ~~~~~ tcomment
nmap <leader>, :TComment<CR>
vmap <leader>, :TComment<CR>
" <c-_><c-_>   :: :TComment

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
" ~~~~~ nvim lspconfig

lua << EOF
local nvim_lsp = require('lspconfig')
local cmp = require'cmp'
local lspkind = require('lspkind')

-- Setup nvim-cmp.
cmp.setup({
snippet = {
  expand = function(args)
  require('luasnip').lsp_expand(args.body)
  end,
},
mapping = {
  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.close(),
  ['<CR>'] = cmp.mapping.confirm({
  behavior = cmp.ConfirmBehavior.Replace,
  select = true,
  }),
  ['<Tab>'] = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif vim.fn  == 1 then
    feedkey("<Plug>(vsnip-expand-or-jump)", "")
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
    end
    end,
    ['<S-Tab>'] = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
      feedkey("<Plug>(vsnip-jump-prev)", "")
    else
      fallback()
      end
      end,
},
sources = {
  { name = 'nvim_lsp' },
  { name = 'buffer' },
  { name = 'path' },
  { name = 'luasnip' },
},
formatting = {
  format = lspkind.cmp_format({
  with_text = true,
  menu = ({
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  path = "[Path]",
  luasnip = "[LuaSnip]",
  }),
  }),
},
})

-- Setup lspconfig.
nvim_lsp.solargraph.setup {
  cmd = { "/Users/david/.asdf/shims/solargraph", "stdio" },
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
EOF
