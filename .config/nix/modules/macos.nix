{ ... }: {
  # nix-darwin's system-wide /etc/zshrc duplicates work home-manager's
  # user zshrc already does properly (see modules/home.nix): its own
  # unpatched `compinit` alone cost ~600ms on every shell start, plus a
  # `promptinit`/`prompt suse` call that's immediately overridden by
  # powerlevel10k anyway. Keep programs.zsh.enable (needed for nix's
  # PATH/session setup) but drop the redundant completion/prompt init.
  programs.zsh = {
    enableCompletion = false;
    enableBashCompletion = false;
    promptInit = "";
  };

  # Captured from this Mac's live System Settings (defaults read ...) so a
  # fresh machine ends up configured the same way after darwin-rebuild.
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyleSwitchesAutomatically = true;
      AppleShowAllExtensions = true;
      AppleShowScrollBars = "Always";
      InitialKeyRepeat = 25;
      KeyRepeat = 5;
      "com.apple.swipescrolldirection" = false; # natural scroll off
      _HIHideMenuBar = false;
    };

    menuExtraClock = {
      Show24Hour = true;
      ShowDate = 2;
      ShowDayOfWeek = false;
    };

    controlcenter = {
      Bluetooth = false;
      Sound = false;
    };

    dock = {
      autohide = true;
      mru-spaces = false; # don't rearrange Spaces by recent use
      show-recents = false;
      static-only = false; # false = persistent-apps stay pinned when closed
      tilesize = 25;
      persistent-apps = [
        "/Applications/Ghostty.app"
        "/Applications/Firefox Developer Edition.app"
        "/Applications/Visual Studio Code.app"
        "/Applications/Slack.app"
      ];
    };

    finder = {
      AppleShowAllFiles = true;
      ShowPathbar = true;
      ShowStatusBar = false;
      FXPreferredViewStyle = "Nlsv"; # list view
    };

    trackpad = {
      Clicking = false; # tap to click off
      Dragging = false;
      TrackpadThreeFingerDrag = false;
    };

    screencapture = {
      type = "jpg";
    };

    CustomUserPreferences = {
      NSGlobalDomain = {
        NSAutomaticCapitalizationEnabled = true;
        NSAutomaticPeriodSubstitutionEnabled = true;
      };
    };
  };

  # Touch ID for sudo (fingerprint instead of password wherever sudo asks).
  # reattach fixes Touch ID not working inside tmux.
  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true;
  };
}
