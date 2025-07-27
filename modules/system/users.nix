{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.krysteq = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Krysteq";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
