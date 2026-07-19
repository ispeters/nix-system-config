_: {
  # This is disabled for now because I have no Homebrew-managed
  # packages. To enable it, make sure to update flake.nix to have
  # Nix install Homebrew.
  # homebrew = {
  #   enable = true;
  #   onActivation.cleanup = "zap";
  #   casks = [
  #     # put Homebrew-installed packages here
  #   ];
  # };
}
