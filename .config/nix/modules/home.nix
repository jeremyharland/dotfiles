{ pkgs, lib, ... }: {
  # home-manager owns the interactive shell (theme, plugins, aliases). It
  # sources plugin files straight from the nix store at build time, so
  # there's no path-guessing and no dependency on what nix-darwin's
  # environment.pathsToLink happens to expose in /run/current-system/sw.
  home.stateVersion = "24.05";

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    defaultKeymap = "emacs";

    shellAliases = {
      # listing
      l = "eza -lh  --icons=auto";
      ls = "eza -1   --icons=auto";
      ll = "eza -lha --icons=auto --sort=name --group-directories-first";
      ld = "eza -lhD --icons=auto";

      # misc
      vim = "nvim";
      pn = "pnpm";
      python = "python3";
      pip = "pip3";
      mkdir = "mkdir -p";

      # navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../../../..";
      ".5" = "cd ../../../../..";
      docs = "cd ~/Documents";

      # git
      gst = "git status";
      gss = "git status -s";
      ga = "git add";
      gaa = "git add --all";
      gc = "git commit -v";
      gcmsg = "git commit -m";
      gco = "git checkout";
      gcb = "git checkout -b";
      gb = "git branch";
      gp = "git push";
      gpl = "git pull";
      gl = "git log --oneline --graph --decorate";
      gd = "git diff";
      gds = "git diff --staged";
      grh = "git reset HEAD";
      gsta = "git stash";
      gstp = "git stash pop";

      # gh
      ghpr = "gh pr create";
      ghprv = "gh pr view --web";
      ghprs = "gh pr status";
      ghi = "gh issue list";
      ghr = "gh repo view --web";
      ghc = "gh repo clone";
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # login-shell env, previously in loose ~/.zshenv / ~/.zprofile
    envExtra = ''
      # uv
      export PATH="/Users/jeremy/.local/bin:$PATH"
    '';
    profileExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"

      # Added by OrbStack: command-line tools and integration
      # This won't be added again if you remove it.
      source ~/.orbstack/shell/init.zsh 2>/dev/null || :
    '';

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    initContent = lib.mkMerge [
      # Powerlevel10k instant prompt must stay as close to the top of
      # .zshrc as possible — run `p10k configure` to (re)generate ~/.p10k.zsh.
      (lib.mkOrder 500 ''
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
      '')

      # zsh-completions' function definitions need to be in fpath before
      # compinit runs.
      (lib.mkOrder 550 ''
        fpath=(${pkgs.zsh-completions}/share/zsh/site-functions $fpath)
      '')

      (lib.mkOrder 1000 ''
        [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

        # up/down arrow: filter history to lines starting with what's already
        # typed, instead of cycling every history entry (oh-my-zsh core default)
        autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
        zle -N up-line-or-beginning-search
        zle -N down-line-or-beginning-search
        bindkey "^[[A" up-line-or-beginning-search
        bindkey "^[[B" down-line-or-beginning-search

        command -v fzf    >/dev/null && eval "$(fzf --zsh)"
        command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
        command -v mise   >/dev/null && eval "$(mise activate zsh)"
      '')
    ];
  };
}
