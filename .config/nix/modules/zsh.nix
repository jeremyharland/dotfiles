{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    enableFzfCompletion = true;
    enableFzfGit = true;
    enableFzfHistory = true;

    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    '';

    interactiveShellInit = ''
      # extra completion definitions (replaces oh-my-zsh's zsh-completions plugin)
      fpath=(${pkgs.zsh-completions}/share/zsh/site-functions $fpath)

      # up/down arrow: filter history to lines starting with what's already
      # typed, instead of cycling every history entry (oh-my-zsh core default,
      # lost when oh-my-zsh was dropped)
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

      eval "$(zoxide init zsh)"
      eval "$(mise activate zsh)"
    '';
  };
}
