"---------------------------------------------
" Plugin management
"
" Download vim-plug from the URL below and follow the installation
" instructions:
" https://github.com/junegunn/vim-plug
"----------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', 	{ 'do': ':UpdateRemotePlugins' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-hclfmt',	{ 'do': 'go get github.com/fatih/hclfmt' }
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'zchee/deoplete-go', 	{ 'do': 'make'}
Plug 'scrooloose/nerdtree'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'

" Language support
Plug 'fatih/vim-go',		{ 'do': ':GoInstallBinaries' }
Plug 'b4b4r07/vim-hcl'
Plug 'cespare/vim-toml'
Plug 'jelera/vim-javascript-syntax'
Plug 'tpope/vim-fireplace'        " Clojure
Plug 'guns/vim-clojure-static'    " Clojure
Plug 'guns/vim-clojure-highlight' " Clojure
Plug 'elixir-editors/vim-elixir'  " Elixir
Plug 'slashmili/alchemist.vim'    " Elixir
Plug 'mhinz/vim-mix-format'       " Elixir

" Color scheme
Plug 'dracula/vim'

" Others
Plug 'mhinz/vim-startify'

call plug#end()


"----------------------------------------------
" General settings
"----------------------------------------------
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
set clipboard=unnamedplus
set colorcolumn=100               " highlight the 100th column as an indicator
set completeopt-=preview          " remove the horrendous preview window
set cursorline                    " highlight the current line for the cursor
set encoding=UTF-8
set expandtab                     " expands tabs to spaces
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!
set number relativenumber         " show number ruler using the relative line number
set ruler
set formatoptions=tcqron          " set vims text formatting options
set softtabstop=2
set tabstop=2
set textwidth=100
set title                         " let vim set the terminal title
set updatetime=100                " redraw the status bar often

" Enable mouse if possible
if has('mouse')
    set mouse=a
endif

" Color scheme
color dracula
" Workaround to https://github.com/dracula/vim/issues/11
set termguicolors

" Allow vim to set a custom font or color for a word
syntax enable

" Set the leader button
let mapleader = ','


"----------------------------------------------
" Searching
"----------------------------------------------
set incsearch                     " move to match as you type the search query
set hlsearch                      " disable search result highlighting

if has('nvim')
    set inccommand=split          " enables interactive search and replace
endif

" Clear search highlights
map <Esc> :nohlsearch<cr>

" These mappings will make it so that going to the next one in a search will
" center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv


"----------------------------------------------
" Navigation
"----------------------------------------------
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Move between buffers with Shift + arrow key...
nnoremap <S-Left> :bprevious<cr>
nnoremap <S-Right> :bnext<cr>

" ... but skip the quickfix when navigating
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" Fix some common typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


"----------------------------------------------
" Splits
"----------------------------------------------
" Create horizontal splits below the current window
set splitbelow
set splitright

" Creating splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Closing splits
nnoremap <leader>q :close<cr>

" Deleting buffer
nnoremap <leader>c :bd<cr>


"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif


"----------------------------------------------
" Plugin: zchee/deoplete-go
"----------------------------------------------
" Enable completing of go pointers
let g:deoplete#sources#go#pointer = 1


"----------------------------------------------
" Plugin: w0rp/ale
"----------------------------------------------
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1


"----------------------------------------------
" Plugin: vim-airline/vim-airline
"----------------------------------------------
" Show status bar by default.
set laststatus=2

" Enable top tabline.
let g:airline#extensions#tabline#enabled = 1

" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 0

" Enable powerline fonts.
let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Symbols
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '>'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '<'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'


"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
" Toggle nerdtree
map <C-m> :NERDTreeToggle<CR>

" Close vim when the last open window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"----------------------------------------------
" Plugin: rainbow_parentheses.vim
"----------------------------------------------
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0


"----------------------------------------------
" Plugin: mhinz/mix-format
"----------------------------------------------
let g:mix_format_on_save = 1


"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Mappings
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F12> <Plug>(go-def)
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
au FileType go nmap <leader>gd <Plug>(go-def)
au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <leader>gdh <Plug>(go-def-horizontal)
au FileType go nmap <leader>gD <Plug>(go-doc)
au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gtc :GoTestCompile<cr>

" Run goimports when running gofmt
let g:go_fmt_command = "goimports"

" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1


"----------------------------------------------
" Language: HCL
"----------------------------------------------
au FileType hcl set noexpandtab
au FileType hcl set shiftwidth=2
au FileType hcl set softtabstop=2
au FileType hcl set tabstop=2


"----------------------------------------------
" Language: Javascript
"----------------------------------------------
"
" In order to activate fully javascript linting
" the following libs must to be installed globally
"
" ```
" npm install -g eslint
" npm install -g babel-eslint
" npm install -g eslint-plugin-react
" ```
au FileType javascript set noexpandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2


"----------------------------------------------
" Language: TOML
"----------------------------------------------
au FileType toml set expandtab
au FileType toml set shiftwidth=2
au FileType toml set softtabstop=2
au FileType toml set tabstop=2



"----------------------------------------------
" Language: Protobuf
"----------------------------------------------
au FileType proto set expandtab
au FileType proto set shiftwidth=2
au FileType proto set softtabstop=2
au FileType proto set tabstop=2


"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2


"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set noexpandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2


"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set noexpandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2


"----------------------------------------------
" Language: Clojure
"----------------------------------------------
au FileType clj set noexpandtab
au FileType clj set shiftwidth=2
au FileType clj set softtabstop=2
au FileType clj set tabstop=2


"----------------------------------------------
" Language: SQL
"----------------------------------------------
au FileType sql set noexpandtab
au FileType sql set shiftwidth=2
au FileType sql set softtabstop=2
au FileType sql set tabstop=2


"----------------------------------------------
" Language: Elixir
"----------------------------------------------
au FileType elixir set noexpandtab
au FileType elixir set shiftwidth=2
au FileType elixir set softtabstop=2
au FileType elixir set tabstop=2


" Enable rainbow parentheses plugin on start up
au BufEnter *.clj :RainbowParenthesesLoadRound
au BufEnter *.clj :RainbowParenthesesLoadSquare
au BufEnter *.clj :RainbowParenthesesLoadBraces
au BufEnter *.clj :RainbowParenthesesToggle
