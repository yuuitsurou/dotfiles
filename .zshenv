# 重複したパスを登録しない
typeset -U path

path=(
	~/bin(N-/)
	$path
)
