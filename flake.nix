{
  description = "Albert's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, self, ... } @ inputs:
    let
      username = "albert";
    in
    {
      nixosConfigurations = import ./modules/core/default.nix {
        inherit self nixpkgs inputs username;
      };
    };
}
