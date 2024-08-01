{
  pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/dce8fc727dc2891628e4f878bb18af643b7b255d.tar.gz";
  }) { },
}:

pkgs.mkShell { buildInputs = [ pkgs.nodejs ]; }
