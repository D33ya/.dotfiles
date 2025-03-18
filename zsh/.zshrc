# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/d33ya/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# env variables
export EDITOR="nvim"
export VISUAL="nvim"
# path
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/Documents/build/zig-linux-x86_64-0.14.0-dev.3427+dea72d15d/
# Dircolors
alias ls='ls --color=auto'
eval "$(dircolors ~/.from_src/themes/dircolors/catpputccin)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Starship for prompt
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Syntax highlighting colors
source ~/.from_src/themes/zsh-syntax-highlighting/themes/catppuccin_macchiato-zsh-syntax-highlighting.zsh

# Syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto suggestion
source ~/.from_src/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias py="ipython"

