{ ... }:

{
    imports = [
        ./bootloader.nix
        ./kernel.nix
        ./locale.nix
        ./programs.nix
        ./users.nix
    ];
}
