set nocompatible              " be iMproved, required
filetype off                  " required
" Change mapleader
let mapleader=","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Elixir syntax
" Plugin 'elixir-lang/vim-elixir'

" Dash
Plugin 'rizzatti/dash.vim'
nmap <silent> <leader>dc <Plug>DashSearch

" Track the engine.
Plugin 'SirVer/ultisnips'

" vim-tags: dependence: brew install ctags
Plugin 'szw/vim-tags'
let g:vim_tags_use_language_field = 1
let g:vim_tags_auto_generate = 0
" vim bugs: Generate tags in project root dir or vim will not jump to tags
let g:vim_tags_directories = []

" taglist
Plugin 'vim-scripts/taglist.vim'
nnoremap <silent> <F8> :TlistToggle<CR>

" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" filesystem tree
Plugin 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTree %:p:h<CR>

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

Plugin 'editorconfig/editorconfig-vim'
Plugin 'mattn/emmet-vim'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled=1
" Open Table Of Content
map <Leader>th :Toch<CR>
" Format table
map <Leader>ft :TableFormat<CR>

Plugin 'Valloric/YouCompleteMe'
map <Leader>jg :YcmCompleter GoTo<CR>
map <Leader>jd :YcmCompleter GoToDefinition<CR>
map <Leader>ji :YcmCompleter GoToInclude<CR>
map <Leader>jr :YcmCompleter GoToReferences<CR>
map <Leader>dd :YcmCompleter GetDoc<CR>

Plugin 'jiangmiao/auto-pairs'

" quick google search
Plugin 'szw/vim-g'

Plugin 'vim-ruby/vim-ruby'

" Plugin 'wlangstroth/vim-racket'

" Plugin 'fatih/vim-go'

Plugin 'cakebaker/scss-syntax.vim'

Plugin 'chrisbra/Colorizer'

:let g:colorizer_auto_color = 1
:let g:colorizer_auto_filetype='less,sass,scss,js,css,html'
let g:colorizer_syntax = 1

Plugin 'tpope/vim-commentary'

Plugin 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR><CR>

Plugin 'Lokaltog/vim-easymotion'
" Disable default mappings"
let g:EasyMotion_do_mapping = 0
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>jj <Plug>(easymotion-j)
map <Leader>kk <Plug>(easymotion-k)

Plugin 'rking/ag.vim'
map <Leader>ag :Ag <right>

Plugin 'vim-scripts/DrawIt'

Plugin 'tpope/vim-eunuch'

Plugin 'vim-scripts/DeleteTrailingWhitespace'

" all lanugage support
Plugin 'sheerun/vim-polyglot'

" change surroundins - cs/ds/ysiw/yss
Plugin 'tpope/vim-surround'

" do syntax check
" Plugin 'scrooloose/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" " Toogle Syntastic check mode
" map <Leader>ts :SyntasticToggleMode<CR>
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ["eslint"]

" use ale to replace syntastic since ale support async check
Plugin 'w0rp/ale'

" Write this in your vimrc file
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
set statusline+=%{ALEGetStatusLine()}

" fuzzy file find
Plugin 'kien/ctrlp.vim'
let g:ctrlp_by_filename = 0
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/.venv/*

" vim cscope
" Plugin 'vim-scripts/cscope.vim'

" Elm lang
" Plugin 'lambdatoast/elm.vim'

" ansible yaml support
Plugin 'chase/vim-ansible-yaml'

" fireplace for clojure
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-dispatch'

" precision editing for s-expression
Plugin 'guns/vim-sexp'

" clojure runtime files
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'

Plugin 'kien/rainbow_parentheses.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Use the Solarized Dark theme
set background=light
colorscheme solarized
let g:solarized_termtrans=1

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=4
set shiftwidth=4
set expandtab
" Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set lcs=tab:▸\ ,trail:·
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
"if exists("&relativenumber")
"	set relativenumber
"	au BufReadPost * set relativenumber
"endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

au FileType scss setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et
au FileType elm setl sw=2 sts=2 et
au FileType go setl sw=2 sts=2 et

set t_Co=256

" Enable Rainbow Parentheses when dealing with Clojure files
au FileType clojure RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound

" This should enable Emacs like indentation
let g:clojure_fuzzy_indent=1
let g:clojure_align_multiline_strings = 1

" Add some words which should be indented like defn etc: Compojure/compojure-api, midje and schema stuff mostly.
let g:clojure_fuzzy_indent_patterns=['^GET', '^POST', '^PUT', '^DELETE', '^ANY', '^HEAD', '^PATCH', '^OPTIONS', '^def']
autocmd FileType clojure setlocal lispwords+=describe,it,testing,facts,fact,provided

" Disable some irritating mappings
let g:sexp_enable_insert_mode_mappings = 0"

" basic keymapping
noremap <leader>c :! compass compile<CR>
noremap <Leader>ff <PageDown>
noremap <Leader>bb <PageUp>
" remove ^M marks where file is edit in window
noremap <Leader>cm :%s/\r//g<CR>

" search/replace keymapping
noremap rc :%s///cg<Left><Left><Left><Left>
noremap rr :%s///g<Left><Left><Left>
noremap ri :%s///cig<Left><Left><Left><Left><Left>

" elixir keymapping
noremap <leader>ed :! mix deps.get<CR>
noremap <leader>ec :! mix compile<CR>
noremap <leader>et :! mix test<CR>
noremap <leader>xt :! mix test<CR>

" clojure keymapping
noremap <leader>cd :! lein deps<CR>
noremap <leader>cc :! lein compile<CR>
noremap <leader>ct :! lein test<CR>
noremap <leader>ce :Eval<CR>

" golang keymapping
noremap <leader>gd :! go get<CR>
noremap <leader>gc :! make<CR>
noremap <leader>gt :! make test<CR>

" tcl keymapping
noremap <leader>tt :set noexpandtab<CR>

" javascript keymapping
noremap <leader>jt :!jasmine-node .

" web page
noremap <leader>eh :! open http://elixir-lang.org/docs/stable/elixir/<CR>
noremap <leader>exh :! open http://www.phoenixframework.org/v0.9.0/docs<CR>
noremap <leader>ehp :! open https://hex.pm<CR>

noremap <leader>gh :! open https://github.com<CR>