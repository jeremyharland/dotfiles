{ ... }: {
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
}
