{ ... }: {
  # Per-app preferences, captured from live `defaults read <domain>` output.
  # Only meaningful user settings are kept here — internal/runtime state
  # (window frames, timestamps, version strings, telemetry IDs) is left out
  # since it regenerates itself and isn't something you'd want to "restore".
  #
  # Skipped apps:
  # - Superwhisper: no plain-text settings file, just ML model binaries,
  #   a license cache and an anonymous ID under ~/Library/Application
  #   Support — nothing safe or meaningful to track in git.
  # - Maccy: still on defaults, nothing customized yet to capture.
  system.defaults.CustomUserPreferences = {
    "com.knollsoft.Rectangle" = {
      hideMenubarIcon = true;
      launchOnLogin = true;
      reflowTodo = { keyCode = 45; modifierFlags = 786432; };
      toggleTodo = { keyCode = 11; modifierFlags = 786432; };
    };

    "eu.exelban.Stats" = {
      LaunchAtLoginNext = true;
      telemetry = false;

      Battery_widget = "bar_chart";
      Network_widget = "speed";
      Sensors_widget = "";
    };
  };
}
