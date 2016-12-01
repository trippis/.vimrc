" system settings
set nocompatible " don't use old vi commands
set noshowmode
set noswapfile
set tabstop=2 shiftwidth=2 expandtab
set relativenumber number " Vim 8.0 enables hybrid numbering mode
set numberwidth=4 " number margin width
set textwidth=80 " wrap at 80 characters
set colorcolumn=+1 " make it obvious where 80 charaters is

syntax on
syntax enable
filetype plugin indent on

if (has("termguicolors"))
	set termguicolors
endif

colorscheme base16-ocean

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
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'scrooloose/nerdtree' " nav panel for folder structure

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
let g:syntatsic_typescript_checkers = ['tsuquyomi']
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
