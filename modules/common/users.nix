{ pkgs, ... }:
{
  # ensure Nix-managed Bash is in /etc/shells
  environment.shells = [ pkgs.bashInteractive ];

  users.users.ianpetersen = {
    home = "/Users/ianpetersen";
    shell = pkgs.bashInteractive;
  };
}
