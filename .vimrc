"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
"        by Y.Mine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Kaoriya 対策
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:no_vimrc_example') && g:no_vimrc_example == 1
	silent! source $VIMRUNTIME/vimrc_example.vim
endif
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When started as "evim", evim.vim will already have done these settings.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if v:progname =~? "evim"
  finish
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 互換モード
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow backspacing over everything in insert mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" バックアップ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
"  set backup		" keep a backup file
   set autowrite nobackup nowritebackup
   set backupcopy=yes
endif
set backupdir=$HOME/.vim.d/bkup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 履歴
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=100		" keep 50 lines of command line history
set showcmd		" display incomplete commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 検索
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set magic
set ignorecase
set smartcase
set nohlsearch
set incsearch		" do incremental searching
set wrapscan

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't use Ex mode, use Q for formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Only do this part when compiled with support for autocommands.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
     au!
     " For all text files set 'textwidth' to 78 characters.
     autocmd FileType text setlocal textwidth=78
     " When editing a file, always jump to the last known cursor position.
     " Don't do it when the position is invalid or when inside an event handler
     " (happens when dropping a file on gvim).
     autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal g`\"" |
       \ endif
  augroup END
  augroup Binary
    au!
    au BufReadPre *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin uf &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
  augroup END
  augroup InsertHook
    au!
    au InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
    au InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
  augroup END 
else
  set autoindent smartindent		" always set autoindenting on
endif " has("autocmd")
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不可視文字 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set list
set listchars=tab:>-
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" タブ設定 
" tabstop				: Tab文字を画面上で何文字分に展開するか
" shiftwidth		: autoindent時に挿入されるインデントの幅
" softtabstop		: Tabキー押し下げ時に挿入される空白の量, 0はtabstopに同じ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4 shiftwidth=4 softtabstop=0
set smarttab
set noexpandtab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 括弧のマッチング
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch warn
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 補完
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wildmode=list:full
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ファイルブラウズ時にバッファのディレクトリをカレントにする
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set browsedir=buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set enc=utf-8
"set fenc=utf-8
"set fencs=euc-jp,cp932,utf-8,iso-2022-jp
if &encoding !=# 'utf-8'
	set encoding=japan
	set fileencoding=japan
endif
if has('iconv')
	let s:enc_euc = 'euc-jp'
	let s:enc_jis = 'iso-2022-jp'
	"iconvがeuc-jp-msに対応しているかをチェック
	if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'eucjp-ms'
		let s:enc_jis = 'iso-2022-jp-3'
	"iconvがJISX0213に対応しているかをチェック
	elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'euc-jisx0213'
		let s:enc_jis = 'iso-2022-jp-3'
	endif
	"fileencodingsを構築
	if &encoding ==# 'utf-8'
		let s:fileencodings_default = &fileencodings
		let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
		let &fileencodings = &fileencodings .','. s:fileencodings_default
		unlet s:fileencodings_default
	else
		let &fileencodings = &fileencodings .','. s:enc_jis
		set fileencodings+=utf-8,ucs-2le,ucs-2
		if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
			set fileencodings+=cp932
			set fileencodings-=euc-jp
			set fileencodings-=euc-jisx0213
			set fileencodings-=eucjp-ms
			let &encoding = s:enc_euc
			let &fileencoding = s:enc_euc
		else
			let &fileencodings = &fileencodings .','. s:enc_euc
		endif
	endif
	"定数を処分
	unlet s:enc_euc
	unlet s:enc_jis
endif
if has('autocmd')
	function! AU_ReCheck_FENC()
		if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
			let &fileencoding=&encoding
		endif
	endfunction
	autocmd BufReadPost * call AU_ReCheck_FENC()
endif
"改行コードの自動認識
set ffs=unix,dos,mac
if exists('&ambiwidth')
	set ambiwidth=double
endif
autocmd FileType cvs :set fileencoding=euc-jp
autocmd FileType svn :set fileencoding=utf-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set ruler		" show the cursor position all the time
set viminfo='20,\"50
"set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set statusline=[%n]\ %t\ %y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%r%m%=%c:%l/%L\ ASCII=%b\ HEX=%B
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" visual bell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set visualbell t_vb=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IMEのカーソル色
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('multi_byte_ime')
	highlight CUrsorIM guibg=Purple guifg=NONE
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windowsのシェル
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ("gui_win32")
	set shell=D:\cygwin\bin\bash.exe
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 変更中のファイルでも、保存しないで他のファイルを表示する
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 行番号
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" スワップファイル
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &directory=&backupdir
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 画面最後の行をできる限り表示する
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set display=lastline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" テキスト挿入中の自動折り返しを日本語に対応させる
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set formatoptions+=mM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dein settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=/home/ymine/.vim.d/dein/repos/github.com/Shougo/dein.vim
call dein#begin('~/.vim.d/dein')
call dein#add('Shougo/dein.vim')
"call dein#add('Shougo/unite.vim')
"call dein#add('Shougo/neomru.vim')
call dein#add('vim-scripts/Zenburn')
call dein#add('jdkanani/vim-material-theme')
call dein#add('jonathanfilip/vim-lucius')
call dein#add('jeetsukumaran/vim-nefertiti')
call dein#add('w0ng/vim-hybrid')
call dein#add('jacoborus/tender.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('Townk/vim-autoclose')
call dein#add('jremmen/vim-ripgrep')
"call dein#add('rking/ag.vim')
call dein#end()
if dein#check_install()
	call dein#install()
endif

set grepprg=rg\ -nH\ --no-heading\ --color\ never
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" insert modeで開始
"let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
"let g:unite_enable_ignore_case = 1
"let g:unite_enable_smart_case = 1

" grep検
"nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
"nnoremap <silent> ,g  :<C-u>Unite grep -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
"nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
"nnoremap <silent> ,cg :<C-u>Unite grep -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
"nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
"if executable('rg')
"  let g:unite_source_grep_command = 'rg'
"  let g:unite_source_grep_default_opts = '--no-heading --color never'
"  let g:unite_source_grep_recursive_opt = ''
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &t_Co > 2 || has("gui_running")
  syntax on
endif
" set cursorline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" END OF THIS FILE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
