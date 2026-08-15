{ pkgs, ... }: {
  # Interactive shell config (theme, plugins, aliases) lives in the stowed
  # ~/.zshrc so it's shared with the Arch machine too — see ../../../.zshrc.
  # This module only does the two things that have to happen on the Nix
  # side: install the plugin packages, and wire zsh-completions' functions
  # into fpath before compinit runs (has to happen here — compinit runs in
  # /etc/zshrc, which loads before ~/.zshrc).
  environment.systemPackages = [
    pkgs.zsh-powerlevel10k
    pkgs.zsh-autosuggestions
    pkgs.zsh-syntax-highlighting
    pkgs.zsh-completions
  ];

  # nix-darwin only symlinks a fixed set of share/ subpaths into
  # /run/current-system/sw (see environment.pathsToLink). zsh-syntax-highlighting
  # installs to share/zsh-syntax-highlighting (a sibling of share/zsh, not nested
  # under it), so without this it never shows up for ~/.zshrc to source.
  environment.pathsToLink = [ "/share/zsh-syntax-highlighting" ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableFzfCompletion = true;
    enableFzfGit = true;
    enableFzfHistory = true;

    interactiveShellInit = ''
      fpath=(${pkgs.zsh-completions}/share/zsh/site-functions $fpath)
    '';
  };
}
