{
  description = "Ian's system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";

    # See the long comment below regarding why this is here but disabled.
    # Don't forget to add these variables to outputs' arguments.
    # nix-homebrew.url = "github:zhaofengli/nix-homebrew";           # new
    # homebrew-core = { url = "github:homebrew/homebrew-core"; flake = false; };   # new
    # homebrew-cask = { url = "github:homebrew/homebrew-cask"; flake = false; };   # new
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      mac-app-util,
    }:
    {
      darwinConfigurations.macbookpro = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          # not currently used in the system configuration; it's for
          # managing the installation of .App files so Spotlight can
          # find them, but I don't yet have any system-defined apps
          # that need this.
          mac-app-util.darwinModules.default
          # Enabling this will cause Nix to manage Homebrew so that
          # it can use Homebrew to manage packages that haven't been
          # packaged for Nix. I don't have any of those, and would
          # prefer a Nix package over a Homebrew cask any time it's
          # available so I'm leaving this here "just in case".
          # nix-homebrew.darwinModules.nix-homebrew
          # {
          #   nix-homebrew = {
          #     enable = true;
          #     user = "ianpetersen";
          #     taps = {
          #       "homebrew/homebrew-core" = homebrew-core;
          #       "homebrew/homebrew-cask" = homebrew-cask;
          #     };
          #   };
          # }
          ./hosts/macbookpro
          ./modules/common/nix-settings.nix
          ./modules/common/packages.nix
          ./modules/common/users.nix
          ./modules/darwin/fonts.nix
          ./modules/darwin/homebrew.nix
          ./modules/darwin/packages.nix
          ./modules/darwin/xcode-clt.nix
        ];
      };

      # Placeholder for later — add once the NixOS box is being configured.
      # nixosConfigurations."nixos-laptop" = nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   modules = [
      #     ./modules/common/nix-settings.nix
      #     ./modules/common/packages.nix
      #     ./modules/common/users.nix
      #     ./modules/nixos/boot.nix          # doesn't exist yet
      #     ./modules/nixos/networking.nix    # doesn't exist yet
      #     ./hosts/nixos-laptop
      #   ];
      # };
    };
}
