"""-----------------------------------------
" Encoding Setting
"-----------------------------------------
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5

"-----------------------------------------
" Envirement Setting
"-----------------------------------------
filetype on					" 偵測檔案類型
filetype indent on			" 根據檔案類型進行縮排
filetype plugin on			" 根據偵測到的檔案類型載入對應 plugin
filetype plugin indent on	" 啟動自動完成

set nocompatible	" VIM 不使用和 VI 相容的模式
set confirm      	" 操作過程有衝突時，以明確的文字來詢問
set background=dark " 啟用暗色背景模式 
set hlsearch        " 搜尋結果上色

set nobackup		" 取消備份
set noswapfile		" 取消swap
set autoread		" 文件修改之後自動載入
set t_ti= t_te= 	" 離開後資料還會顯示在螢幕上

syntax enable       " 開啟語法上色
syntax on		    " 允許指定語法上色替代預設配置

set cursorline      " 標示目前列
set number          " 標示行號
set wrap            " 邊界拆行
set wildmenu
set ignorecase
set incsearch
set laststatus=2    " 總是顯示狀態欄

set tabstop=4		" 設定tab的寬度
set shiftwidth=4	" 每一次縮排對應的空格數
set softtabstop=4	" 按刪除鍵一次刪除四個空格
set smarttab
set expandtab		" 將tab用空格代替 [需要輸入真正tab，使用Ctrl+V + Tab]

set foldmethod=indent   " 根據縮排折疊
set nofoldenable        " 開啟vim時預設不折疊
set foldnestmax=3       " 最多摺疊三層
"set foldcolumn=2        " 左側空兩格顯示摺疊深度

set backspace=eol,start,indent


"-----------------------------------------
" ShortCut Setting
"-----------------------------------------
" 設置 <Leader>
let mapleader="z"                                  

" 貼上模式
nnoremap <silent> <Leader>p :set paste<CR>

" 全部折疊
nnoremap <silent> <Leader>q zM<CR>

" 全部展開
nnoremap <silent> <Leader>z zR<CR> 

" 開關視覺縮排
nnoremap <silent> <Leader>i <Plug>IndentGuidesToggle

" 切換背景亮暗(colorscheme 會被切成 default)
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

"-----------------------------------------
" Vim Bundle Plugin Manager & Plugins
"-----------------------------------------
let iCanHazNeoBundle=1
let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
        let iCanHazNeoBundle=0
endif


if 0 | endif
    if &compatible
        set nocompatible
endif

set runtimepath^=~/.vim/bundle/neobundle.vim/       "run time path必須

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'               "NeoBundle自我管理

" My Bundles here:
" NeoBundle 'Shougo/vimproc.vim'                      " NeoBundle 使用
NeoBundleLazy 'honza/vim-snippets'
NeoBundleLazy 'klen/python-mode'
" NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'bling/vim-airline'                       " powerline 輕量化版
NeoBundle 'vim-airline/vim-airline-themes'          " airline 主題
NeoBundle 'xolox/vim-misc'                          " vim-colorscheme-switcher 必需
NeoBundle 'xolox/vim-colorscheme-switcher'          " 切換 colorscheme
NeoBundle 'altercation/vim-colors-solarized'        " vim colorscheme
NeoBundle 'tomasr/molokai'                          " vim colorscheme
NeoBundle 'tpope/vim-fugitive'                      " 用來讓 airline 顯示 git branch
NeoBundle 'octol/vim-cpp-enhanced-highlight'        " 增強C/C++語法上色
NeoBundle 'nathanaelkane/vim-indent-guides'         " 視覺化縮排
NeoBundle 'scrooloose/nerdcommenter'                " 快速註解
NeoBundle 'Shougo/neocomplete'                      " 自動補齊 選單
NeoBundle 'Shougo/neosnippet'                       " 快速模板工具
NeoBundle 'Shougo/neosnippet-snippets'              " 快速模板定義
NeoBundle 'chriskempson/vim-tomorrow-theme'         " 支援多種 IDE 的 colorscheme theme

call neobundle#end()

filetype plugin indent on                           " 必須

NeoBundleCheck                                      " 安裝確認

"簡易指令
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles


"-----------------------------------------
" Plugin Setting
"-----------------------------------------

" vim-AirLine
let g:airline_powerline_fonts = 1
let g:solarized_termcolors=256
set t_Co=256

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
colorscheme molokai

" Neosnippet
" Plugin key-mappings.
imap <C-d>     <Plug>(neosnippet_expand_or_jump)
smap <C-d>     <Plug>(neosnippet_expand_or_jump)
xmap <C-d>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" vim-colorscheme-switcher
" let g:colorscheme_switcher_define_mappings = 0                    " 改變預設shift<F8>、<F8>的mapping，需自訂
" let g:colorscheme_switcher_keep_background = 1                    " 只切換同背景色的 colorscheme
let g:colorscheme_switcher_exclude_builtins = 1                     " 內建的不加入切換清單
" let g:colorscheme_switcher_exclude = ['default', 'test']          " 自訂排除的 colorscheme
