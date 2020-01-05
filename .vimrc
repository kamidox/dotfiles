set nocompatible              " be iMproved, required
filetype off                  " required
" Change mapleader
let mapleader=","

" Plugins will be downloaded under the specified directory.
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Elixir syntax
" Plug 'elixir-lang/vim-elixir'

" Dash
" Plug 'rizzatti/dash.vim'
" nmap <silent> <leader>dc <Plug>DashSearch

" Snippets engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-x>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" vim tags depending on universal-ctags
" https://github.com/universal-ctags/ctags
" brew install --HEAD universal-ctags/universal-ctags/universal-ctags
Plug 'ludovicchabant/vim-gutentags'
set tags=./.tags;,.tags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" taglist
Plug 'vim-scripts/taglist.vim'
nnoremap <silent> <F8> :TlistToggle<CR>
map <C-l> :TlistToggle<CR>
let Tlist_WinWidth = 30
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
map <C-d> :SignifyDiff<CR>

" filesystem tree
Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTree %:p:h<CR>

Plug 'vim-airline/vim-airline'
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

Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled=1
" Open Table Of Content
map <Leader>th :Toch<CR>
" Format table
map <Leader>ft :TableFormat<CR>

Plug 'Valloric/YouCompleteMe'
map <Leader>jg :YcmCompleter GoTo<CR>
map <Leader>jd :YcmCompleter GoToDefinition<CR>
map <Leader>ji :YcmCompleter GoToInclude<CR>
map <Leader>jr :YcmCompleter GoToReferences<CR>
map <Leader>dd :YcmCompleter GetDoc<CR>
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0

Plug 'jiangmiao/auto-pairs'

" quick google search
Plug 'szw/vim-g'

" Plug 'vim-ruby/vim-ruby'

" Plug 'wlangstroth/vim-racket'

" Plug 'fatih/vim-go'

Plug 'cakebaker/scss-syntax.vim'

Plug 'chrisbra/Colorizer'

:let g:colorizer_auto_color = 1
:let g:colorizer_auto_filetype='less,sass,scss,js,css,html'
let g:colorizer_syntax = 1

Plug 'tpope/vim-commentary'

Plug 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR><CR>

Plug 'Lokaltog/vim-easymotion'
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

Plug 'rking/ag.vim'
map <Leader>ag :Ag <right>

" Plug 'vim-scripts/DrawIt'

Plug 'tpope/vim-eunuch'

Plug 'vim-scripts/DeleteTrailingWhitespace'

" all lanugage support
Plug 'sheerun/vim-polyglot'

" change surroundins - cs/ds/ysiw/yss
Plug 'tpope/vim-surround'

" use ale to replace syntastic since ale support async check
Plug 'dense-analysis/ale'

" Write this in your vimrc file
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 0
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\   'c': ['clang'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
set statusline+=%{ALEGetStatusLine()}

" Plug to support load local vimrc
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
let g:local_vimrc = ['.local_vimrc', '_vimrc_local.vim']

" fuzzy file find
Plug 'kien/ctrlp.vim'
let g:ctrlp_by_filename = 0
let g:ctrlp_root_markers = ['.root', '.project']
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/.venv/*
map <c-b> :CtrlPBuffer<CR>
map <c-t> :CtrlPBufTag<CR>

" vim cscope
" Plug 'vim-scripts/cscope.vim'

" Elm lang
" Plug 'lambdatoast/elm.vim'

" ansible yaml support
Plug 'chase/vim-ansible-yaml'

" fireplace for clojure
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-dispatch'

" precision editing for s-expression
" Plug 'guns/vim-sexp'

" erlang plugins
" Plug 'vim-erlang/vim-erlang-runtime'
" Plug 'vim-erlang/vim-erlang-compiler'
" Plug 'vim-erlang/vim-erlang-omnicomplete'
" Plug 'vim-erlang/vim-erlang-tags'

" clojure runtime files
" Plug 'guns/vim-clojure-static'
" Plug 'guns/vim-clojure-highlight'

" Initialize plugin system
" https://github.com/junegunn/vim-plug
call plug#end()

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
" Make tabs as wide as four spaces
set tabstop=4
set shiftwidth=4
set expandtab
" Highlight current line
set cursorline
" highlight cursorline ctermfg=white ctermbg=yellow cterm=bold guifg=white guibg=yellow gui=bold
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
"set relativenumber
"au BufReadPost * set relativenumber
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

augroup python_files
    autocmd!
    autocmd FileType python set expandtab
    autocmd FileType python set tabstop=4
    autocmd FileType python set shiftwidth=4
augroup END

set t_Co=256

" Disable some irritating mappings
let g:sexp_enable_insert_mode_mappings = 0"

" Set file encoding chains
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
" Reload file with GB18030
noremap <leader>gb :e ++enc=gb18030<CR>

" basic keymapping
noremap <leader>c :! compass compile<CR>
noremap <Leader>ff <PageDown>
noremap <Leader>bb <PageUp>
noremap <Leader>ww <C-w>w
" remove ^M marks where file is edit in window
noremap <Leader>cm :%s/\r//g<CR>
" delete current buffer
noremap <Leader>db :bdelete<CR>

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