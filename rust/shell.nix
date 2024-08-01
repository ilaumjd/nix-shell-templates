{
  pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/f7207adcc68d9cafa29e3cd252a18743ae512c6a.tar.gz";
  }) { },
}:

pkgs.mkShell {
  buildInputs = [
    pkgs.cargo
    pkgs.rustc
  ];
}
