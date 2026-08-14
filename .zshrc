source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Path to powerlevel10k theme
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=(
  git
  zsh-completions
)
source $ZSH/oh-my-zsh.sh


# Helpful aliases
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code --ozone-platform-hint=wayland --disable-gpu' # gui code editor
alias vim='nvim'
alias pn='pnpm'
alias python=python3
alias pip=pip3

# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

eval "$(starship init zsh)"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
eval "$(zoxide init zsh)"
eval "$(/Users/jeremy/.local/bin/mise activate zsh)"
