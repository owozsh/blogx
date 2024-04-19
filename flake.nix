{
  outputs = { self, nixpkgs, flake-utils }:
    let
      pkgs = import nixpkgs { inherit system; };
    in flake-utils.lib.eachDefaultSystem (system: {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
                    elixir_1_16
		    erlang_26
		    postgresql_16
		    inotify-tools
		];
      };
    });
}
