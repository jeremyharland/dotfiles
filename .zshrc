# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Single source of truth for interactive shell config (theme, plugins,
# aliases). Stowed to ~/.zshrc on every machine, Arch or Mac — plugin files
# just live in different places depending on package manager, so
# `_zsh_source_first` below checks both.

_zsh_source_first() {
  for f in "$@"; do
    [[ -r "$f" ]] && { source "$f"; return; }
  done
}

# theme
_zsh_source_first \
  /run/current-system/sw/share/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme \
  /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh # run `p10k configure` to (re)generate

# autosuggestions / syntax-highlighting (order matters: highlighting last)
_zsh_source_first \
  /run/current-system/sw/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
_zsh_source_first \
  /run/current-system/sw/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# up/down arrow: filter history to lines starting with what's already typed,
# instead of cycling every history entry (oh-my-zsh core default)
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# listing
alias l='eza -lh  --icons=auto'
alias ls='eza -1   --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias ld='eza -lhD --icons=auto'

# misc
alias vim='nvim'
alias pn='pnpm'
alias python=python3
alias pip=pip3
alias mkdir='mkdir -p'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias docs='cd ~/Documents'

# git (replaces oh-my-zsh's git plugin)
alias gst='git status'
alias gss='git status -s'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gds='git diff --staged'
alias grh='git reset HEAD'
alias gsta='git stash'
alias gstp='git stash pop'

# gh (GitHub CLI)
alias ghpr='gh pr create'
alias ghprv='gh pr view --web'
alias ghprs='gh pr status'
alias ghi='gh issue list'
alias ghr='gh repo view --web'
alias ghc='gh repo clone'

command -v fzf   >/dev/null && eval "$(fzf --zsh)"
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
command -v mise  >/dev/null && eval "$(mise activate zsh)"
