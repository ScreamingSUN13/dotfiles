# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

set -g fish_greeting

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

#Initializes fastfetch oh-my-posh and atuin
fastfetch
oh-my-posh init fish --config ~/.config/oh-my-posh/noctalia.json | source
fish_add_path ~/bin
atuin init fish | source

#Set nvim as default
set -gx EDITOR nvim


#alias ls='gls -lhFa --group-directories-first --color=auto'

#Aliases
alias ls='eza --git --group-directories-first -lhaU'
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lconfig='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
