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
Plug 'vim-scripts/comments.vim'
Plug 'bling/vim-airline'
Plug 'tomasr/molokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
"Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'veapon/vimDoxygenToolkit'
"Plug 'tomtom/checksyntax_vim'
"Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'vim-php/tagbar-phpctags.vim'
"Plug 'spf13/PIV'
"Plug 'pearofducks/ansible-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mileszs/ack.vim'
Plug 'fatih/vim-go'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

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
set nofoldenable

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

"===== TagBar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:deoplete#enable_at_startup = 1
autocmd FileType * nested :call tagbar#autoopen(0)

"===== Doxygen
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

"===== Insert current date
map da :call Da()<cr>
function! Da()
	exec "normal a" . strftime("%Y-%m-%d")
endfunction

"===== Tabular
if exists(":Tabularize")
	nmap <Leader>t :Tabularize /=><CR>
	vmap <Leader>t :Tabularize /=><CR>
endif

"===== vim-go
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)

"===== Airline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"===== deoplete
let g:deoplete#enable_at_startup = 1

" automate source the .vimrc file
autocmd BufWritePost .vimrc so %
