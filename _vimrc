" Description : Veapon's Vim config file
" Create : 2011-4-10
" Last Update : 2011-5-25
" Website : http://veapon.com
" Contact : veapon88@gmail.com
" Version : for gvim
"
"Disable VI compatible mode
set nocompatible

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
map <F7> :NERDTree D:\www<cr>
let NERDTreeChristmasTree = 1
let NERDTreeMouseMode = 1
let NERDTreeShowBookmarks = 1
let NERDTreeWinSize = 25

"=====================Taglist confi=======================
map <F8> :TlistToggle <cr>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 25
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let tlist_php_settings='php;c:Classes;f:Functions;d:Constants;j:Javascript Functions'



"===================PHP Function AutoComplete============
set dictionary-=C:\\Program\ Files\ (x86)\\Vim\\php_func_list.txt dictionary+=C:\\Program\ Files\ (x86)\\Vim\\php_func_list.txt
set complete-=k complete+=k
function! InserTabWrapper()
	let col = col('.')-1
	if !col || getline('.')[col-1] !~ '\k'
		return "\<TAB>"
	else
		return "\<C-N>"
	endif
endfunction
inoremap <TAB> <C-R>=InserTabWrapper()<cr>

set tags=tags;
set autochdir

set runtimepath+=C:\\Program\ Files\ (x86)\\Vim\\phpmunual 
autocmd BufNewFile,Bufread *.php,*.php3,*.php4 set keywordprg="help"

"===================Doxygen===============
let g:DoxygenToolkit_copyrightString = "luoo.net"
let g:DoxygenToolkit_authorName="veapon"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_compactDoc="yes"
map <F9> :ClassDox <cr>
map <F10> :Dox <cr>

map <C-s> :w <cr>
map <F4> :cw <cr>
map <F5> :!php -l %<cr>
map <F12> :!firefox -l %<cr>
map da :call Da()<cr>

function! Da()
	exec "normal a" . strftime("%Y-%m-%d")
endfunction
