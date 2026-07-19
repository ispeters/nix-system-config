_: {
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [
      "@admin"
      "ianpetersen"
    ];
  };
  nixpkgs.config.allowUnfree = true; # needed if you add anything proprietary later
}
