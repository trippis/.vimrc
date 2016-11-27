set nocompatible " don't use old vi commands
set number " I like to display the editor line numbers
set numberwidth=5
set textwidth=80 " make it obvious where 80 characters is
set colorcolumn=+1,30

colorscheme distinguished " good colorscheme for javascript coding

" habit breaker - stop using the arrow keys
nnoremap <Left> :echo "Use H key for left" <CR>
nnoremap <Right> :echo "Use L key for right" <CR>
nnoremap <Up> :echo "Use K key for up" <CR>
nnoremap <Down> :echo "Use J key for down" <CR>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>

" Using vim-plug for plug management in autoload directory -
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate' "provide insert mode auto-completion for quotes etc
Plug 'SirVer/ultisnips' "the ultimate snippet solution for vim
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' } "provides autocompletion
Plug 'pangloss/vim-javascript' " syntax highlighting and indentation
Plug 'scrooloose/syntastic' " syntax checking hacks for vim
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-sensible' " a sensible set of default settings
Plug 'walm/jshint.vim' " for linting JS files

call plug#end()

" UltiSnips directory & trigger configuration. Do not use <tab> if you use YCP
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntatsic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']




