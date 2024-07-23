{ pkgs ? import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/ab82a9612aa45284d4adf69ee81871a389669a9e.tar.gz";
}) {} }:

pkgs.mkShell {
  buildInputs = [ pkgs.nodejs_20 ];
}
