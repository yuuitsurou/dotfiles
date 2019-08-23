" vim:set ts=8 sts=2 sw=2 tw=0: (���̍s�Ɋւ��Ă�:help modeline���Q��)
"
" An example for a Japanese version gvimrc file.
" ���{��ł̃f�t�H���gGUI�ݒ�t�@�C��(gvimrc)
"
" Last Change: 30-Nov-2009.
" Maintainer:  MURAOKA Taro <koron@tka.att.ne.jp>
"
" ���:
" ���̃t�@�C���ɂ�Vim�̋N�����ɕK���ݒ肳���AGUI�֘A�̐ݒ肪������Ă���
" ���B�ҏW���̋����Ɋւ���ݒ��vimrc�ɏ�������Ă��܂��B
"
" �l�p�ݒ��_gvimrc�Ƃ����t�@�C�����쐬�������ōs�Ȃ��܂��B_gvimrc�͂���
" �t�@�C���̌�ɓǍ��܂�邽�߁A�����ɏ����ꂽ���e���㏑�����Đݒ肷�邱�Ƃ�
" �o���܂��B_gvimrc��$HOME�܂���$VIM�ɒu���Ă����K�v������܂��B$HOME��$VIM
" �����D�悳��A$HOME�ł݂������ꍇ$VIM�͓Ǎ��܂�܂���B
"
" �Ǘ��Ҍ����ɖ{�ݒ�t�@�C���𒼐ڏ����������ɍς܂��邱�Ƃ�ړI�Ƃ��āA�T�C
" �g���[�J���Ȑݒ��ʃt�@�C���ōs�Ȃ���悤�ɔz�����Ă���܂��BVim�N������
" �T�C�g���[�J���Ȑݒ�t�@�C��($VIM/gvimrc_local.vim)�����݂���Ȃ�΁A�{��
" ��t�@�C�����ǂݍ��܂��O�Ɏ����I�ɓǂݍ��݂܂��B
"
" �ǂݍ��݌�A�ϐ�g:gvimrc_local_finish����0�̒l�ɐݒ肳��Ă����ꍇ�ɂ͖{��
" ��t�@�C���ɏ����ꂽ���e�͈�؎��s����܂���B�f�t�H���g�����S�č����ւ�
" �����ꍇ�ɗ��p���ĉ������B
"
" �Q�l:
"   :help gvimrc
"   :echo $HOME
"   :echo $VIM
"   :version

"---------------------------------------------------------------------------
" �T�C�g���[�J���Ȑݒ�($VIM/vimrc_local.vim)������Γǂݍ��ށB�ǂݍ��񂾌��
" �ϐ�g:vimrc_local_finish�ɔ�0�Ȓl���ݒ肳��Ă����ꍇ�ɂ́A����ȏ�̐ݒ�
" �t�@�C���̓Ǎ��𒆎~����B
if filereadable($VIM . '/gvimrc_local.vim')
  source $VIM/gvimrc_local.vim
  if exists('g:gvimrc_local_finish') && g:gvimrc_local_finish != 0
    finish
  endif
endif

"---------------------------------------------------------------------------
" Bram���̒񋟂���ݒ����C���N���[�h (�ʃt�@�C��:vimrc_example.vim)�B����
" �ȑO��g:no_gvimrc_example�ɔ�0�Ȓl��ݒ肵�Ă����΃C���N���[�h���Ȃ��B
if !exists('g:no_gvimrc_example') || g:no_gvimrc_example == 0
  source $VIMRUNTIME/gvimrc_example.vim
endif

"---------------------------------------------------------------------------
" �t�H���g�ݒ�:
"
"if has('win32')
  " Windows�p
  " set guifont=�l�r_�S�V�b�N:h11:cSHIFTJIS
  "	set guifont=KonatuTohaba:h11:cSHIFTJIS
  "	set guifont=VL_�S�V�b�N:h11:cSHIFTJIS
  "	set guifont=DejaVu\ Sans\ Mono\ 12
  "	set guifont=UmePlus\ Gothic\ Regular\ 10
  	set guifont=Monospace\ Regular\ 11
  " �s�Ԋu�̐ݒ�
  set linespace=2
"elseif has('xfontset')
  " UNIX�p (xfontset���g�p)
"  set guifontset=a14,r14,k14
"elseif has('mac')
"  set guifont=Osaka�|����:h14
"endif

"---------------------------------------------------------------------------
" �E�C���h�E�Ɋւ���ݒ�:
"
" �E�C���h�E�̕�
set columns=80
" �E�C���h�E�̍���
set lines=30
" �R�}���h���C���̍���(GUI�g�p��)
set cmdheight=2
" ��ʂ����n�ɔ��ɂ��� (���s�̐擪�� " ���폜����ΗL���ɂȂ�)
"colorscheme desert " (GUI�g�p��)
"colorscheme material-theme " (GUI�g�p��)
colorscheme nefertiti
"set t_Co=256
"set background=dark

"---------------------------------------------------------------------------
" ���{����͂Ɋւ���ݒ�:
"
if has('multi_byte_ime') || has('xim')
  " IME ON���̃J�[�\���̐F��ݒ�(�ݒ��:��)
  highlight CursorIM guibg=Purple guifg=NONE
  " �}�����[�h�E�������[�h�ł̃f�t�H���g��IME��Ԑݒ�
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIM�̓��͊J�n�L�[��ݒ�(s-space��Shift+Space��kinput2+canna�p�ݒ�)
    "set imactivatekey=s-space
    set imactivatekey=
  endif
  " �}�����[�h�ł�IME��Ԃ��L�������Ȃ��ꍇ�A���s�̃R�����g������
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"---------------------------------------------------------------------------
" �}�E�X�Ɋւ���ݒ�:
"
" ���:
" mousefocus�͊�����(���:�E�B���h�E�𕪊����Ă��郉�C���ɃJ�[�\��������
" �Ă��鎞�̋���)������̂Ńf�t�H���g�ł͐ݒ肵�Ȃ��BWindows�ł�mousehide
" ���A�}�E�X�J�[�\����Vim�̃^�C�g���o�[�ɒu�����{�����͂���ƃ`���`������
" �Ƃ������������N���B
"
" �ǂ̃��[�h�ł��}�E�X���g����悤�ɂ���
set mouse=a
" �}�E�X�̈ړ��Ńt�H�[�J�X�������I�ɐؑւ��Ȃ� (mousefocus:�ؑւ�)
set nomousefocus
" ���͎��Ƀ}�E�X�|�C���^���B�� (nomousehide:�B���Ȃ�)
set mousehide
" �r�W���A���I��(D&D��)�������I�ɃN���b�v�{�[�h�� (:help guioptions_a)
set guioptions+=a

"---------------------------------------------------------------------------
" ���j���[�Ɋւ���ݒ�:
"
" ���:
" 'M'�I�v�V�������w�肳�ꂽ�Ƃ��̓��j���[('m')�E�c�[���o�[('T')���ɓo�^����
" �Ȃ��̂ŁA�����I�ɂ����̗̈���폜����悤�ɂ����B����āA�f�t�H���g�̂�
" ���𖳎����ă��[�U���Ǝ��̈ꎮ��o�^�����ꍇ�ɂ́A����炪�\������Ȃ���
" ������肪��������B���������܂�Ƀ��A�ȃP�[�X�ł���ƍl������̂Ŗ�����
" ��B
"
if &guioptions =~# 'M'
  let &guioptions = substitute(&guioptions, '[mT]', '', 'g')
endif

"---------------------------------------------------------------------------
" ���̑��A���h���Ɋւ���ݒ�:
"
" ������������n�C���C�g���Ȃ�(_vimrc�ł͂Ȃ�_gvimrc�Őݒ肷��K�v������)
"set nohlsearch

"---------------------------------------------------------------------------
" ����Ɋւ���ݒ�:
"
" ����:
" �����GUI�łȂ��Ă��ł���̂�vimrc�Őݒ肵���ق����ǂ���������Ȃ��B���̕�
" ���Windows�ł͂��Ȃ�B���B��ʓI�Ɉ���ɂ͖����A�ƌ����邱�Ƃ�����炵
" ���̂Ńf�t�H���g�t�H���g�͖����ɂ��Ă����B�S�V�b�N���g�������ꍇ�̓R�����g
" �A�E�g���Ă���printfont���Q�l�ɁB
"
" �Q�l:
"   :hardcopy
"   :help 'printfont'
"   :help printing
"
" ����p�t�H���g
if has('printer')
  if has('win32')
    set printfont=DejaVu_Sans_Mono:h11:cSHIFTJIS
    "set printfont=�l�r_�S�V�b�N:h12:cSHIFTJIS
  endif
endif

" Copyright (C) 2002 KaoriYa/MURAOKA Taro
set guioptions-=T
