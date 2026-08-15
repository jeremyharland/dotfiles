{
  description = "mbp nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }:
  let
    username = "jeremy";

    configuration = { pkgs, ... }: {
      imports = [
        ./modules/packages.nix
        ./modules/homebrew.nix
        ./modules/macos.nix
        ./modules/apps.nix
      ];

      # home-manager derives home.username/home.homeDirectory from this.
      users.users.${username}.home = "/Users/${username}";

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${username} = import ./modules/home.nix;
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      nixpkgs.config.allowUnfree = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # User running darwin-rebuild; required for user-scoped options (e.g. homebrew).
      system.primaryUser = username;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#mbp
    darwinConfigurations."mbp" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        home-manager.darwinModules.home-manager
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Rosetta
            enableRosetta = true;

            user = username;
          };
        }
      ];
    };
  };
}
