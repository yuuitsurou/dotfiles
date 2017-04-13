# LANG
export LANG=ja_JP.UTF-8

# prompt
autoload -Uz colors
colors
case ${UID} in
0)
  PROMPT="%B%{${fg[green]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[green]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[green]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[green]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[green]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[green]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

# auto change directory
setopt auto_cd

# auto directory pushd
setopt auto_pushd
setopt pushd_ignore_dups

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

# do not remove postfix slash of command line
setopt noautoremoveslash

# no beep
setopt no_beep

# emacs like key
bindkey -d
bindkey -e

# command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

# completion
autoload -Uz compinit
compinit

zstyle ':completion:*' format '%B%d%b'
zstyle ':completeion:*' group-name ''
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache yes
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"

setopt complete_in_word

setopt print_eight_bit

setopt ignore_eof

setopt interactive_comments

setopt complete_aliases

alias ll='ls -al'

setopt auto_param_slash

setopt mark_dirs

setopt list_types

setopt auto_menu

setopt auto_param_keys

