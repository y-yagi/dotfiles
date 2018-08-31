set tabstop=2
set softtabstop=2
set shiftwidth=2

set encoding=utf-8
set fileformat=unix
set termencoding=utf-8

set nu
set ic

scriptencoding utf-8

set expandtab
set formatoptions-=rq
set backupdir=$HOME/vimbackup
set directory=$HOME/vimbackup
"set dictionary=$HOME/vimfiles/dict/php.dict set incsearch "set list set number set showmatch

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
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif

" let NeoBundle manage NeoBundle
" required!
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle 'Shougo/neobundle.vim'
" recommended to install
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
"NeoBundle 'rails.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'fuenor/JpFormat.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'vim-scripts/AutoComplPop'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'vim-scripts/DirDiff.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'vim-scripts/smartchr'
NeoBundle 'basyura/wwwrefe.vim'
NeoBundle 'basyura/TweetVim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/vim-oauth'
" NeoBundle 'mileszs/ack.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'tpope/vim-surround'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'ngmy/vim-rubocop'

" unite sources
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'ujihisa/unite-gem'
NeoBundle 'basyura/unite-rails'
NeoBundle 'sgur/unite-qf'

NeoBundle 'tyru/open-browser.vim'
NeoBundle 'chreekat/vim-instant-markdown'

" colorschemes
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'sjl/badwolf'
NeoBundle 'djjcast/mirodark'
NeoBundle 'chriskempson/tomorrow-theme'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'nixprime/cpsm'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'isRuslan/vim-es6'
NeoBundle 'fatih/vim-go'
NeoBundle 'KabbAmine/zeavim.vim'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'prettier/vim-prettier'
NeoBundle 'leafgarland/typescript-vim'

call neobundle#end()


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
let g:NeoComplCache_CachingPercentInStatusline = 1

" Define dictionary.
let g:NeoComplCache_DictionaryFileTypeLists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'ruby' : $DOTVIM.'/dict/ruby.dict'
            \ }

" Define keyword.
if !exists('g:NeoComplCache_KeywordPatterns')
    let g:NeoComplCache_KeywordPatterns = {}
endif
let g:NeoComplCache_KeywordPatterns['default'] = '\v\h\w*'

"let g:NeoComplCache_SnippetsDir = $HOME.'/snippets'
"imap <C-k> <Plug>(neocomplcache_start_unite_comple)
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#snippets_directory = $HOME.'/snippets'

""" qfixhown
set runtimepath+=~/.vim/bundle/qfixhowm/
" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定

let howm_dir             = '~/Dropbox/memo/'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'UTF-8'
let howm_fileformat      = 'unix'


" color
colorscheme molokai
set background=dark
"colorscheme "Tomorrow-Night"


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
let g:unite_enable_start_insert=1
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

vnoremap y "+y

set gfn=Takaoゴシック\ 11
set clipboard=unnamedplus
" IME
inoremap <silent> <ESC> <ESC>
inoremap <silent> <C-[> <ESC>
inoremap <silent> <C-j> <C-^>
set formatoptions+=mM


" autocomplpop
inoremap <silent> <expr> ,t
      \ (exists('#AutoComplPopGlobalAutoCommand#InsertEnter#*')) ? "\<C-o>:AutoComplPopDisable\<CR>" : "\<C-o>:AutoComplPopEnable\<CR>"
" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<TAB>"
  else
    if pumvisible()
      return "\<C-N>"
    else
      return "\<C-N>\<C-P>"
    end
  endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" }}} Autocompletion using the TAB key

" vimfiler
let g:vimfiler_safe_mode_by_default = 0
"nnoremap <Space>f :<C-u>VimFiler<CR>

:command! OpenTempfile :edit `=tempname()`

" delete space
autocmd BufWritePre * :%s/\s\+$//ge

autocmd BufRead,BufNewFile *.md  setfiletype markdown

" go
set rtp+=$GOSRC/misc/vim
exe "set rtp+=".globpath($GOSRC, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview
autocmd FileType go compiler go
let g:go_fmt_command = "goimports"

" ctrlp
map <Leader>b :CtrlPBuffer<cr>
let g:ctrlp_match_window_bottom   = 0
let g:ctrlp_match_window_reversed = 0
"let g:ctrlp_user_command = 'files -p %s'  " use go get github.com/mattn/files

" for work
let g:vimrubocop_config = '/home/yaginuma/work/Qualizm/.rubocop.yml'

" calendar
let g:calendar_frame = 'default'
let g:calendar_google_calendar = 1
set t_Co=256

" prettier
autocmd FileType javascript set formatprg=prettier\ --stdin


command! -nargs=1 Gmilk call s:Gmilk("gomilk -a", <f-args>)

function! s:Gmilk(cmd, arg)
  silent execute "cgetexpr system(\"" . a:cmd . " ". a:arg . "\")"
  if len(getqflist()) == 0
    echohl WarningMsg
    echomsg "No match found."
    echohl None
  else
    "execute "Unite -auto-preview qf"
    execute "Unite qf"
    redraw!
  endif
endfunction

set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

let g:quickrun_config = { 'python': { 'command': 'python3' } }
