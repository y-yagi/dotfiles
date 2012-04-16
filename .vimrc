set tabstop=2
set softtabstop=2 
set shiftwidth=2 

set fileencoding=UTF-8
set fileformat=unix  

scriptencoding utf-8

set expandtab
set formatoptions-=rq
set backupdir=$HOME/vimbackup
set directory=$HOME/vimbackup
"set dictionary=$HOME/vimfiles/dict/php.dict
set incsearch
"set list
set number

set showmatch

color skittles_dark
colorscheme Dark2

set wrap

"全角スペースを視覚化 
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

let g:Align_xstrlen=3
function! CSVH(x)
    execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
    execute 'normal ^'.a:x.'f,'
endfunction
command! -nargs=1 Csvhl :call CSVH(<args>)


function! ShebangExecute()
  let m = matchlist(getline(1), '#!\(.*\)')
  if(len(m) > 2)
    execute '!'. m[1] . ' %'
  else
    execute '!' &ft ' %'
  endif
endfunction
nmap ,e :call ShebangExecute()<CR>


function! ExecuteCompile()
  let result = system(&ft . 'c ' . bufname(""))
  echo result
endfunction
nmap ,c :call ExecuteCompile()<CR>


function! ExecuteClassFile()
  let buf = matchlist(bufname(""), '\(.*\)\.scala')
  execute '!' . &ft . ' ' . buf[1]  
  "  let result = system(&ft . ' ' . buf[1])
  "echo result
endfunction
nmap ,z :call ExecuteClassFile()<CR>

"set imdisable 

map sy :call YanktmpYank()<CR>
map sp :call YanktmpPaste_p()<CR>
map sP :call YanktmpPaste_P()<CR>

"set background=dark
"set clipboard=unnamed,autoselect 

set nocompatible               " be iMproved
filetype plugin indent off     " required!

"検索ハイライトの削除
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" ファイルを開くとそのディレクトリに移動
" 一部のファイルのみにしたい場合は
" au BufEnter *.xml,*.doc execute \":lcd \" . expand("%:p:h")
" のようにする
au BufEnter * execute ":lcd " . expand("%:p:h")

" vimgrepで自動的にQuickWindowsを開く
au QuickfixCmdPost vimgrep cw

nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

" Set augroup.
augroup MyAutoCmd
    autocmd!
augroup END
" Load .gvimrc after .vimrc edited at GVim.
if !has('gui_running') && !(has('win32') || has('win64'))
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC | 
                \if has('gui_running') | source $MYGVIMRC  
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif


" plugin 
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" let NeoBundle manage NeoBundle
" required! 
NeoBundle 'Shougo/neobundle.vim'
" recommended to install
NeoBundle 'Shougo/vimproc'
" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
"NeoBundle 'rails.vim'  
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'fuenor/JpFormat.vim'   
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplcache'   
NeoBundle 'vim-scripts/AutoComplPop'



" Use neocomplcache.
let g:NeoComplCache_EnableAtStartup = 1
" Use smartcase.
let g:NeoComplCache_SmartCase = 1
" Use camel case completion.
let g:NeoComplCache_EnableCamelCaseCompletion = 1
" Use underbar completion.
let g:NeoComplCache_EnableUnderbarCompletion = 1
" Set minimum syntax keyword length.
let g:NeoComplCache_MinSyntaxLength = 3
" Set manual completion length.
let g:NeoComplCache_ManualCompletionStartLength = 0

" Print caching percent in statusline.
"let g:NeoComplCache_CachingPercentInStatusline = 1

" Define dictionary.
"let g:NeoComplCache_DictionaryFileTypeLists = {
"            \ 'default' : '',
"            \ 'vimshell' : $HOME.'/.vimshell_hist',
"            \ 'ruby' : $DOTVIM.'/dict/ruby.dict'
"            \ }
"
" Define keyword. 
if !exists('g:NeoComplCache_KeywordPatterns')
    let g:NeoComplCache_KeywordPatterns = {}
endif
let g:NeoComplCache_KeywordPatterns['default'] = '\v\h\w*'

let g:NeoComplCache_SnippetsDir = $HOME.'/snippets'


""" qfixhown 
set runtimepath+=~/.vim/bundle/qfixhowm/ 
" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = '~/qfixmemo/'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'UTF-8'
let howm_fileformat      = 'unix'


" Mac Vim用設定

color skittles_dark 
colorscheme Dark2  


" JpFormat 
let ExtViewer_txt = "call system('evince %f &')"
let EV_toFenc_txt = '' 

"setlocal omnifunc=syntaxcomplete#Complete 
"setlocal omnifunc=htmlcomplete#CompleteTags
"setlocal omnifunc=rubycomplete#Complete
setlocal omnifunc=syntaxcomplete#Complete 
set omnifunc=syntaxcomplete#Complete 


""" unite.vim
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q 

"vnoremap y "+y  

set gfn=Takaoゴシック\ 11
set clipboard=unnamedplus
