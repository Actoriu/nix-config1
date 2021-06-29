{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  name = "system-dev";
  buildInputs = [ nixfmt ];
}
