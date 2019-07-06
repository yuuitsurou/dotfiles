#!/bin/bash
set -e
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_TARBALL="https://github.com/yuuitsurou/dotfiles/tarball/master"
REMOTE_URL="https://github.com:yuuitsurou/dotfiles.git"
BIN_DIR="${HOME}/bin"
DVLP_DIR="${HOME}/dvlp"
DOCS_DIR="${HOME}/docs"
TMP_DIR="${HOME}/tmp"
# vim
VIM_DIR="${HOME}/.vim.d"
# emacs
EMACS_SRC_DIR="${DOT_DIRECTORY}/emacs"
EMACS_DIR="${HOME}/.emacs.d"
EMACS_INIT_DIR="init.d/24"
EMACS_ELGET_INIT_DIR="${EMACS_INIT_DIR}/init"
EMACS_INITL_DIR="${EMACS_INIT_DIR}/initl"
EMACS_BKUP_DIR="bkup"
EMACS_AUTOSAVE_DIR="autosave"
EMACS_AUTOSAVE_LIST_DIR="auto-save-list"

has() {
  type "$1" > /dev/null 2>&1
}

usage() {
  name=`basename $0`
  cat <<EOF
Usage:
  $name [arguments] [command]

Commands:
  deploy
  initialize

Arguments:
  -f $(tput setaf 1)** warning **$(tput sgr0) Overwrite dotfiles.
  -h Print help (this message)
EOF
  exit 1
}

while getopts :f:h opt; do
  case ${opt} in
    f)
      OVERWRITE=true
      ;;
    h)
      usage
      ;;
  esac
done
shift $((OPTIND - 1))

# If missing, download and extract the dotfiles repository
if [ ! -d ${DOT_DIRECTORY} ]; then
  echo "Downloading dotfiles..."
  mkdir ${DOT_DIRECTORY}

  if has "git"; then
    git clone --recursive "${REMOTE_URL}" "${DOT_DIRECTORY}"
  else
    curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOT_TARBALL}
    tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOT_DIRECTORY}
    rm -f ${HOME}/dotfiles.tar.gz
  fi

  echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
fi


link_files() {
	cd ${DOT_DIRECTORY}
	for f in .??*
	do
	# Force remove the vim directory if it's already there
	[ -n "${OVERWRITE}" -a -e ${HOME}/${f} ] && rm -f ${HOME}/${f}
	if [ ! -e ${HOME}/${f} ]; then
	  # If you have ignore files, add file/directory name here
	  [[ ${f} = ".git" ]] && continue
	  [[ ${f} = ".gitignore" ]] && continue
	  ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
	fi
	done

	cd ${EMACS_SRC_DIR}
	for f in *.*
	do
	if [ ! -e ${EMACS_DIR}/${f} ]; then
	  # If you have ignore files, add file/directory name here
		[[ ${f} = "init.d" ]] && continue
		ln -snfv ${EMACS_SRC_DIR}/${f} ${EMACS_DIR}/${f}
	fi
	done

	cd ${EMACS_SRC_DIR}/${EMACS_INIT_DIR}
	for f in *.*
	do
	if [ ! -e ${EMACS_DIR}/${EMACS_INIT_DIR}/${f} ]; then
	  # If you have ignore files, add file/directory name here
		ln -snfv ${EMACS_SRC_DIR}/${EMACS_INIT_DIR}/${f} ${EMACS_DIR}/${EMACS_INIT_DIR}/${f}
	fi
	done

	cd ${EMACS_SRC_DIR}/${EMACS_ELGET_INIT_DIR}
	for f in *.*
	do
	if [ ! -e ${EMACS_DIR}/${EMACS_ELGET_INIT_DIR}/${f} ]; then
	  # If you have ignore files, add file/directory name here
		ln -snfv ${EMACS_SRC_DIR}/${EMACS_ELGET_INIT_DIR}/${f} ${EMACS_DIR}/${EMACS_ELGET_INIT_DIR}/${f}
	fi
	done

	cd ${EMACS_SRC_DIR}/${EMACS_INITL_DIR}
	for f in *.*
	do
	if [ ! -e ${EMACS_DIR}/${EMACS_INITL_DIR}/${f} ]; then
	  # If you have ignore files, add file/directory name here
		ln -snfv ${EMACS_SRC_DIR}/${EMACS_INITL_DIR}/${f} ${EMACS_DIR}/${EMACS_INITL_DIR}/${f}
	fi
	done

	echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
}

initialize() {
	set +e
	if [ ! -d ${BIN_DIR} ]; then
		mkdir ${BIN_DIR}
	fi
	if [ ! -d ${DVLP_DIR} ]; then
		mkdir ${DVLP_DIR}
	fi
	if [ ! -d ${DOCS_DIR} ]; then
		mkdir ${DOCS_DIR}
	fi
	if [ ! -d ${TMP_DIR} ]; then
		mkdir ${TMP_DIR}
	fi
	if [ ! -d ${VIM_DIR} ]; then
		mkdir -p ${VIM_DIR}/bkup
		mkdir -p ${VIM_DIR}/dein/repos/github.com/Shougo/dein.vim
		git clone https://github.com/Shougo/dein.vim ${VIM_DIR}/dein/repos/github.com/Shougo/dein.vim
	fi
	if [ ! -d ${EMACS_DIR} ]; then
		mkdir -p ${EMACS_DIR}/${EMACS_ELGET_INIT_DIR}
		mkdir -p ${EMACS_DIR}/${EMACS_BKUP_DIR}
		mkdir -p ${EMACS_DIR}/${EMACS_AUTOSAVE_DIR}
		mkdir -p ${EMACS_DIR}/${EMACS_AUTOSAVE_LIST_DIR}
	fi
	echo "$(tput setaf 2)Initialize complete!. ✔︎$(tput sgr0)"
}

command=$1
[ $# -gt 0 ] && shift

case $command in
  deploy)
    link_files
    ;;
  init*)
    initialize
    ;;
  *)
    usage
    ;;
esac

exit 0
