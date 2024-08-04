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

# Colorize grep output 
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias vim='nvim'
alias vi='nvim'
alias ls='lsd'
alias cat='bat'

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval $(thefuck --alias)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="/Users/alex/.local/bin/:$PATH"

# pnpm
export PNPM_HOME="/Users/alex/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.2.2

alias air='~/go/bin/air'

# bun completions
[ -s "/Users/alex/.bun/_bun" ] && source "/Users/alex/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(fzf --zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.json)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
