{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        # Build dependencies
        nativeBuildInputs = with pkgs; [
        ];
        # Runtime dependencies
        buildInputs = with pkgs; [
          elixir
        ];
      in
      {
        devShell = pkgs.mkShell {
          inherit nativeBuildInputs buildInputs;
          # Developer dependencies
          packages = with pkgs; [
            elixir-ls
          ];
        };
      }
    );
}
