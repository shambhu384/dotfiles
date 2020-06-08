set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' 
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/gv.vim'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tobys/vmustache'
Bundle 'tobyS/pdv'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'zivyangll/git-blame.vim'
Bundle 'christoomey/vim-conflicted'
Plugin 'leafgarland/typescript-vim'
Plugin 'fatih/vim-go'
Plugin 'johngrib/vim-game-snake'
Plugin 'adoy/vim-php-refactoring-toolbox'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:

" Nerdtree {{
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" }}

" Basic syntex {{
syntax enable
set background=dark
"colorscheme gloomcontrast
"let g:airline_theme = "palenight"
" }}

" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
filetype indent on
set autoindent
set backspace=indent,eol,start
" }}}

" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}

" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1
" }}}

" Ctrl + P {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" }}}

" Uni {{{

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}


" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_debug = 3
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
" let g:syntastic_auto_jump = 1

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd', 'phpstan']
let g:syntastic_php_phpcs_args='--standard=PEAR,PSR2,Zend'
let g:syntastic_php_phpstan_args='--level=7 -n'
let g:syntastic_php_phpcs_checker = 1
let g:syntastic_php_phpstan_checker = 1
let g:syntastic_php_phpmd_checker = 1
let g:syntastic_php_phpmd_args=''

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '🤬'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_error_symbol = '❗'
let g:syntastic_style_warning_symbol = '😠'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

let g:syntastic_php_phpcs_args='--tab-width=0'
set tabstop=8

"let g:syntastic_yaml_checkers = ['jsyaml', 'yamllint', 'yamlxs']
" A}}}

" vim-php-namespace {{{
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
" }}}
"
" change the mapleader from \ to ,
let mapleader=","

" Ack {{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"}}}

" vim - git {{{
let g:gitgutter_sign_added = '🤞'
let g:gitgutter_sign_modified = '🤔'
let g:gitgutter_sign_removed = '😏'
let g:gitgutter_sign_removed_first_line = '🙃'
let g:gitgutter_sign_modified_removed = '🙃'
" }}}
"

" PHP documenter script bound to Control-P
":autocmd FileType php inoremap <C-d> <ESC>:call PhpDocSingle()<CR>i
"autocmd FileType php nnoremap <C-d> :call PhpDocSingle()<CR>
"autocmd FileType php vnoremap <C-d> :call PhpDocRange()<CR>
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
autocmd FileType php inoremap <buffer> <C-d> <ESC>:call pdv#DocumentWithSnip()<CR>i
autocmd FileType php nnoremap <C-d> :call pdv#DocumentWithSnip()<CR>
autocmd FileType php vnoremap <C-d> :call pdv#DocumentWithSnip()<CR>


nmap <F8> :TagbarToggle<CR>

" Airline {{{

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" }}

" Select and TAB {{{
vmap <Tab> >gv
vmap <S-Tab> <gv
" }}}
" Paste toggle {{{
set pastetoggle="<F5>"
" }}}


" Toggle spelling hints
nnoremap <silent> <leader>ts :set spell!<CR>

" Git blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" Git merge conflict
set stl+=%{ConflictedVersion()}


set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir


" Syntax check
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <leader>e :SyntasticCheck<CR> :SyntasticToggleMode<CR>


nmap ,f :NERDTreeFind<CR>

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
