source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

neofetch
oh-my-posh init fish --config ~/.config/oh-my-posh/aliens.omp.json | source
fish_add_path ~/bin
atuin init fish | source

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
