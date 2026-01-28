 # zmodload zsh/zprof
source "${HOME}/.zgenom/zgenom.zsh"

zgenom autoupdate
zgenom ohmyzsh
zgenom ohmyzsh plugins/git
zgenom ohmyzsh plugins/asdf
zgenom load zdharma-continuum/fast-syntax-highlighting
zgenom load zsh-users/zsh-history-substring-search
zgenom load zsh-users/zsh-autosuggestions
zgenom load zsh-users/zsh-completions
zgenom load djui/alias-tips
zgenom load peterhurford/git-it-on.zsh
zgenom load so-fancy/diff-so-fancy
zgenom load atuinsh/atuin

set -o vi

# Colorize grep output 
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias cdroot='cd ./$(git rev-parse --show-cdup)'

alias vim='nvim'
alias vi='nvim'
alias ls='lsd'
alias cat='bat --paging=never'

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval $(thefuck --alias)

export PATH="/Users/alex/.local/bin/:$PATH"

# pnpm
export PNPM_HOME="/Users/alex/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"


alias air='~/go/bin/air'

# bun completions
[ -s "/Users/alex/.bun/_bun" ] && source "/Users/alex/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(fzf --zsh)"
# eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.json)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
 # zprof
