{
  username,
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username; };

    users.${username} = {
      imports = [
        (import ./home)
      ];
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.11";

      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "uinput" # necesary for sunshine
    ];
  };

  nix.settings.allowed-users = [ "${username}" ];
}
