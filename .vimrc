" Required system settings inspired by
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set nocompatible
set modelines=0
set showmode
set noswapfile
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set relativenumber number
set numberwidth=4
set wrap
set textwidth=80
set colorcolumn=+1
set formatoptions=qrn1
set encoding=utf-8
set scrolloff=3
set autoindent
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undodir=~/.vim/undofiles
set undofile

" remap leader
let mapleader =  ","

" tame search/moving
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

" handy key mappings
inoremap jj <ESC>
vnoremap jj <ESC>
nnoremap <leader><space> :noh<CR>
nnoremap ; :

" user specific custom functions
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l 
nnoremap <leader>rf :so %<CR>
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pc :PlugClean<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-s> <C-w>s

" auto save on exit or tabbing to another app
au FocusLost * :wa

syntax on
syntax enable
filetype plugin indent on

if (has("termguicolors"))
	set termguicolors
endif

colorscheme base16-monokai

" habit breaker - stop using the arrow keys
nnoremap <Left> :echo "Use H key for left" <CR>
nnoremap <Right> :echo "Use L key for right" <CR>
nnoremap <Up> :echo "Use K key for up" <CR>
nnoremap <Down> :echo "Use J key for down" <CR>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>

" Using vim-plug for plug management in the '~/.vim/autoload' directory -
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate' "provide insert mode auto-completion for quotes etc
Plug 'SirVer/ultisnips' "the ultimate snippet solution for vim
Plug 'helino/vim-json' " filetype detection and syntax highlighting for JS
Plug 'othree/html5-syntax.vim' " HTML5 syntax for vim
Plug 'othree/html5.vim' " HTML5 omnicomplete and syntax
Plug 'othree/javascript-libraries-syntax.vim' " syntax file for JS libraries
Plug 'othree/jsdoc-syntax.vim' " Stand alone JSDoc syntax for vim
Plug 'moll/vim-node' " superb for developing node.js apps with vim
Plug 'walm/jshint.vim' " for linting JS files
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' } "provides autocompletion
Plug 'jelera/vim-javascript-syntax' " enhanced javascript syntax for vim
Plug 'pangloss/vim-javascript' " syntax highlighting and indentation
Plug 'Quramy/vim-js-pretty-template' " highlights JS's template strings
Plug 'leafgarland/typescript-vim' " Typescript syntax files for vim
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Interactive command execution
Plug 'Quramy/tsuquyomi' " vim plugin for typescript
Plug 'scrooloose/syntastic' " syntax checking hacks for vim
Plug 'scrooloose/nerdcommenter' " intensely orgasmic commenting
Plug 'scrooloose/nerdtree' " nav panel for folder structure
Plug 'tpope/vim-fugitive' " a Git wrapper so awesome

call plug#end()

" UltiSnips directory & trigger configuration. Do not use <tab> if you use YCP
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntastic settings and show any linting errors immediately
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_typescript_tsc_args = '--target ES5 --noEmit'
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" configure javascript-libraries-syntax
let g:used_javascript_libraries = 'jquery,angularjs,angular'

" typescript-vim settings
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^1]* nested cwindow
autocmd QuickFixCmdPost    1* nested lwindow

" vim-js-pretty-template configuration
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces

" NERDTree config
map <silent> - :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
let NERDTreeShowHidden=1
let g:NerdTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1
