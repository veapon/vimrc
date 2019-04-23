" Description : veapon's Vim config file
" Create : 2011-4-10
" Last Update : 2011-5-25
" Website : http://veapon.com
" Contact : veapon88@gmail.com
"
set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'fholgado/minibufexpl.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/comments.vim'
Plug 'bling/vim-airline'
Plug 'tomasr/molokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
"Plug 'ervandew/supertab'
"Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'veapon/vimDoxygenToolkit'
"Plug 'tomtom/checksyntax_vim'
"Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
"Plug 'JulesWang/css.vim'
"Plug 'rizzatti/dash.vim'
"Plug 'Raimondi/delimitMate'
"Plug 'spf13/PIV'
"Plug 'pearofducks/ansible-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mileszs/ack.vim'
Plug 'fatih/vim-go'
Plug 'vim-syntastic/syntastic'

call plug#end()

"Disable GUI Toolbar and Menubar
set guioptions=

"Color Scheme
colorscheme molokai

"Font and encoding
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=cs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=unix,dos
set guifont=menlo
set langmenu=zh_CN.UTF-8
set helplang=cn
set nobomb

"base config
syntax on
set number
set autoindent
set cindent cino=j1,(0,ws,Ws
set history=1000
set mouse=a
set backspace=indent,eol,start
set magic
set hlsearch
set cursorline
set cursorcolumn
set expandtab
set tabstop=4
set shiftwidth=4

"disable tmp file
set nobackup
set noswapfile

" switch tab
"map <S-n> :tabn <cr>
"map <S-p> :tabp <cr>

"====================miniBufer config====================
let g:miniBufExplTabWrap = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerAutoUpdate = 1
let g:miniBufExplorerMoreThanOne = 0
nmap <F2> :bprev<CR>
nmap <F3> :bnext<CR>

"=====================NERDTree config======================
map <F6> :NERDTree <cr>
map <F7> :NERDTree ~/Workspace/www<cr>
let NERDTreeChristmasTree = 1
let NERDTreeMouseMode = 1
let NERDTreeShowBookmarks = 1
let NERDTreeWinSize = 25
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.$', '\.\.$']

if has('gui_running')
	" open NERDTree automatically
	autocmd vimenter * NERDTree ~/Workspace/www
	" set cursor to left window
	autocmd vimenter * wincmd l
	" set current work dir
	autocmd BufEnter * silent! chdir ~/Workspace/www
endif

"=====================Taglist config=======================
map <F8> :TlistToggle <cr>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 25
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Auto_Open = 1
let tlist_php_settings='php;c:Classes;f:Functions;d:Constants;t:Todo'
let tlist_go_settings = 'go;g:enum;s:struct;u:union;t:type;f:function'

set tags=tags;
set autochdir

"===================Doxygen===============
let g:DoxygenToolkit_copyrightString = ""
let g:DoxygenToolkit_authorName="lwp"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_compactDoc="yes"
let g:DoxygenToolkit_sinceTag="no"
let g:DoxygenToolkit_showFuncAuthor="yes"
map <F9> :ClassDox <cr>
map <F10> :Dox <cr>

map <C-s> :w <cr>
map <F4> :bo cw <cr>
map da :call Da()<cr>

function! Da()
	exec "normal a" . strftime("%Y-%m-%d")
endfunction

"================easymotion
let mapleader=" "
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

if exists(":Tabularize")
	nmap <Leader>t :Tabularize /=><CR>
	vmap <Leader>t :Tabularize /=><CR>
endif

set nofoldenable

" vim-go
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)

" YouCompleteMe
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" automate source the .vimrc file
autocmd BufWritePost .vimrc so %
