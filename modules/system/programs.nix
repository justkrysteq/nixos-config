{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    brave
    vesktop
    lshw # list hardware
    mesa
    kdePackages.kate
    kdePackages.kcalc
    kdePackages.kolourpaint
  ];

  programs = {
    steam.enable = true;

    git = {
      enable = true;
      config = {
        user.name = "Krysteq";
        user.email = "justkrysteq@proton.me";
        init.defaultBranch = "main";
      };
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ff = "fastfetch";
        la = "ls -a";
        rebuild = "sudo nixos-rebuild switch";
        lsgen = "nixos-rebuild list-generations";
        n = "nvim";
#         update = "cd /etc/nixos; sudo nix flake update; sudo nixos-rebuild switch";

      };

      histSize = 5000;
      histFile = "$HOME/.zsh_history";
#       setOptions = [
#         "HIST_IGNORE_AALL_DUPS"
#       ];

      # Plugins
      ohMyZsh = {
        enable = true;
        plugins = [
          "git"
          "z"
        ];
#         theme = "alanpeabody"; # Fajne fioletowe
#         theme = "gallois"; # Ciekawe - pokazuje czas wykonywania komend
        theme = "gentoo"; # Fajne, lepsze kolorki niż pierwszy
#         theme = "risto"; # Podobne do tego wyżej, ciemniejsze ciut
#         theme = "skaro"; # Pokazuje numer linii w historii
#         theme = "agnosterzak"; # External theme, doesn't work ;(
      };
    };
  };
}
