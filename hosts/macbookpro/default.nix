_: {
  networking = {
    computerName = "Ian’s MacBook Pro";
    hostName = "macbookpro";
    localHostName = "macbookpro";
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.primaryUser = "ianpetersen";

  # Bump when you first build; then leave alone. See nix-darwin docs.
  system.stateVersion = 6;
}
