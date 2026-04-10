fastfetch
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

eval "$(atuin init zsh)"

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/aliens.omp.json)"
