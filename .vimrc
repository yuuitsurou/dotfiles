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
let g:python3_host_prog = '/home/ymine/.pyenv/shims/python3'
set runtimepath+=/home/ymine/.vim.d/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('/home/ymine/.vim.d/dein')
  call dein#begin('/home/ymine/.vim.d/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/ymine/.vim.d/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:

"call dein#add('Shougo/unite.vim')
"call dein#add('Shougo/neomru.vim')
call dein#add('vim-scripts/Zenburn')
if ((has('nvim') || has('timers')) && has('python3')) !=# ''
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('Shougo/denite.nvim')
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif
endif
call dein#add('jdkanani/vim-material-theme')
call dein#add('jonathanfilip/vim-lucius')
call dein#add('jeetsukumaran/vim-nefertiti')
call dein#add('w0ng/vim-hybrid')
call dein#add('arcticicestudio/nord-vim')
call dein#add('scrooloose/nerdtree')
call dein#add('jacoborus/tender.vim')
"call dein#add('preservim/nerdtree')
call dein#add('Townk/vim-autoclose')
call dein#add('jremmen/vim-ripgrep')
"call dein#add('rking/ag.vim')
  " You can specify revision/branch/tag.

  " Required:
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"if dein#tap('deoplete.nvim')
"	let g:deoplete#enable_at_startup = 1
"endif

nmap <silent> ,f :<C-u>Denite file<CR>
nmap <silent> ,F :<C-u>Denite file/rec<CR>
nmap <silent> ,g :<C-u>Denite grep<CR>
nmap <silent> ,b :<C-u>Denite buffer<CR>
nmap <silent> ,l :<C-u>Denite line<CR>
" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  " 一つ上のディレクトリを開き直す
  inoremap <silent><buffer><expr> <BS> denite#do_map('move_up_path')
  " imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
  " Deniteを閉じる
  inoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
endfunction

" Change file/rec command.
call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--glob', '!.git'])

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
    \ ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Specify multiple paths in grep source
"call denite#start([{'name': 'grep',
"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])
set grepprg=rg\ -nH\ --no-heading\ --color\ never

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
"if &t_Co > 2 || has("gui_running")
  syntax on
"endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamed

let NERDTreeShowHidden=1 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" END OF THIS FILE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
