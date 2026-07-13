{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pkgs.bashInteractive
    # nothing here yet; packages that make sense on macOS and NixOS go here
  ];
}
