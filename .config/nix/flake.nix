{
  description = "mbp nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.bat
          pkgs.bruno
          pkgs.claude-code
          pkgs.fzf
          pkgs.htop
          pkgs.gh
          pkgs.lazygit
          pkgs.lazydocker
          pkgs.mise
          pkgs.neovim
          pkgs.ripgrep
          pkgs.tmux
          pkgs.zoxide
          pkgs._1password-cli
          pkgs.mpv
          pkgs.fastfetch
          pkgs.speedtest-cli
          pkgs.stow
          pkgs.wget
          pkgs.eza
        ];

      fonts.packages = [
        pkgs.nerd-fonts.hack
      ];

      homebrew = {
        enable = true;
        onActivation.cleanup = "zap";

        casks = [
          "caffeine"
          "chromium"
          "dbeaver-community"
          "discord"
          "figma"
          "firefox@developer-edition"
          "ghostty"
          "google-chrome"
          "intellij-idea"
          "jellyfin-media-player"
          "logi-options+"
          "maccy"
          "notion"
          "orbstack"
          "rectangle"
          "signal"
          "slack"
          "spotify"
          "stats"
          "steam"
          "superwhisper"
          "tailscale-app"
          "tor-browser"
          "visual-studio-code"
          "vlc"
          "webtorrent"
        ];
        brews = [
        ];
        masApps = {
          "Xcode" = 497799835;
        };
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      nixpkgs.config.allowUnfree = true;

      # Enable alternative shell support in nix-darwin.
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

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # User running darwin-rebuild; required for user-scoped options (e.g. homebrew).
      system.primaryUser = "jeremy";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#mbp
    darwinConfigurations."mbp" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Rosetta
            enableRosetta = true;

            user = "jeremy";
          };
        }
      ];
    };
  };
}
