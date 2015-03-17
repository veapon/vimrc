" Description : Veapon's Vim config file
" Create : 2011-4-10
" Last Update : 2011-5-25
" Website : http://veapon.com
" Contact : veapon88@gmail.com
" Version : for gvim
"
set nocompatible              
filetype off                  

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'bling/vim-airline'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'tomasr/molokai'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/comments.vim'
Plugin 'godlygeek/tabular'
Plugin 'veapon/vimDoxygenToolkit'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            
filetype plugin on    
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Disable GUI Toolbar and Menubar
set guioptions-=T
set guioptions-=m

"Color Scheme
colorscheme molokai 

"Font and encoding
set termencoding=utf-8
set encoding=prc
set fileencoding=utf-8
set fileencodings=cs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformat=unix
set guifont=consolas:h10.5
set langmenu=zh_CN.UTF-8
set helplang=cn
set nobomb

"base config
syntax on
set number
set autoindent
set cindent
set history=1000
set mouse=a
set backspace=indent,eol,start
set magic
set hlsearch

"disable tmp file
set nobackup
set noswapfile

" switch tab
map <S-n> :tabn <cr>
map <S-p> :tabp <cr>

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
map <F7> :NERDTree E:\www<cr>
let NERDTreeChristmasTree = 1
let NERDTreeMouseMode = 1
let NERDTreeShowBookmarks = 1
let NERDTreeWinSize = 25
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.$', '\.\.$']

"=====================Taglist confi=======================
map <F8> :TlistToggle <cr>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 25
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Auto_Open = 0
let tlist_php_settings='php;c:Classes;f:Functions;d:Constants;j:Javascript Functions'

set tags=tags;
set autochdir
set runtimepath+=C:\\Program\ Files\ (x86)\\Vim\\phpmunual 
autocmd BufNewFile,Bufread *.php,*.php3,*.php4 set keywordprg="help"

"===================Doxygen===============
let g:DoxygenToolkit_copyrightString = ""
let g:DoxygenToolkit_authorName="veapon(veapon88@gmail.com)"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_compactDoc="yes"
map <F9> :ClassDox <cr>
map <F10> :Dox <cr>

map <C-s> :w <cr>
map <F4> :cw <cr>
map da :call Da()<cr>

function! Da()
	exec "normal a" . strftime("%Y-%m-%d")
endfunction


