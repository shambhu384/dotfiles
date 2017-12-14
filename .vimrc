" Loader
execute pathogen#infect()
syntax on
filetype plugin indent on

"#Nerdtree"

let g:NERDTreeWinSize = 38

" Stick this in your vimrc
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree automatically 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Mapping
map <C-n> :NERDTreeToggle<CR>

" Style
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"/Nerdtree"
"#Syntastic "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"/Syntastic"

"#Airline"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"#Airline"
let g:airline_theme='simple'
"/Airline"


"# Default "

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set nocompatible
set bs=2
set background=dark
set wrapmargin=4
set t_Co=256
" colorscheme wombat256mod
colorscheme apprentice
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let &colorcolumn=join(range(130,999),",")
let &colorcolumn="120,".join(range(130,999),",")

" Adding NerdFonts
set nocompatible " use vim defaults
filetype off " filetype needs to be off before Vundle
set encoding=utf8

" Tabbar
let g:toggleTabs = 1


colorscheme apprentice
"/ Default

" TagBar
nmap <F8> :TagbarToggle<CR>

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

set conceallevel=1
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

