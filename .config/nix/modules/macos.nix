{ ... }: {
  # Captured from this Mac's live System Settings (defaults read ...) so a
  # fresh machine ends up configured the same way after darwin-rebuild.
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleInterfaceStyleSwitchesAutomatically = true;
      AppleShowAllExtensions = true;
      AppleShowScrollBars = "Always";
      InitialKeyRepeat = 25;
      KeyRepeat = 5;
      "com.apple.swipescrolldirection" = false; # natural scroll off
      _HIHideMenuBar = true;
    };

    dock = {
      autohide = true;
      mru-spaces = false; # don't rearrange Spaces by recent use
      show-recents = false;
      tilesize = 25;
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
