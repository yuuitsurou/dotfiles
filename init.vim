set fenc=utf-8
set noswapfile
set autoread
set showcmd

set number
set virtualedit=onemore
set smartindent
set showmatch

set wildmode=list:longest

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
set inccommand=split

set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
set shiftround

set statusline=[%n]\ %t\ %y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%r%m%=%c:%l/%L\ ASCII=%b\ HEX=%B

let g:python_host_prog = $PYENV_ROOT . '/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/deoplete.nvim')
  "let g:deoplete#enable_at_startup = 1
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('vim-scripts/Zenburn')
  call dein#add('joshdick/onedark.vim')
  call dein#add('preservim/nerdtree')
  call dein#add('Townk/vim-autoclose')
  call dein#add('jremmen/vim-ripgrep')
  call dein#add('Shougo/denite.nvim')
  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif


"End dein Scripts-------------------------

"set grepprg=rg\ -nH\ --no-heading\ --color\ never

colorscheme onedark
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

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

