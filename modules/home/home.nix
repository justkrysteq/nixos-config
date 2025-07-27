{ pkgs, ... }: {
    home = {
        username = "krysteq";
        homeDirectory = "/home/krysteq";
        stateVersion = "25.05";

        packages = with pkgs; [
            fastfetch
            btop
            tree
            nvtopPackages.intel
        ];
    };

    programs.neovim = {
        enable = true;
#         defaultEditor = true;
        plugins = with pkgs.vimPlugins; [
            gruvbox-material
            nerdtree
        ];
    };

#     wayland.windowManager.hyprland = {
#         enable = true;
#         settings = {
#
#         };
#     };
}
