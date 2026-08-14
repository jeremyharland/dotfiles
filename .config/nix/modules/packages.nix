{ pkgs, ... }: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.bat
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
}
