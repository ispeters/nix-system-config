{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pkgs.bashInteractive
  ];
}
