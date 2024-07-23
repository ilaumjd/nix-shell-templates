{ pkgs ? import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/f7207adcc68d9cafa29e3cd252a18743ae512c6a.tar.gz";
}) {} }:

let
  # Choose your python version
  myPython = pkgs.python3;
  pythonPackages = pkgs.python3Packages;

  pythonWithPkgs = myPython.withPackages (pythonPkgs: with pythonPkgs; [
    # This list contains tools for Python development.
    # You can also add other tools, like black.
    #
    # Note that even if you add Python packages here like PyTorch or Tensorflow,
    # they will be reinstalled when running `pip -r requirements.txt` because
    # virtualenv is used below in the shellHook.
    ipython
    pip
    setuptools
    virtualenvwrapper
    wheel
    black
  ]);

  extraBuildInputs = with pythonPackages; [
    # this list contains packages that you want to be available at runtime and might not be able to be installed properly via pip
    # pandas
    # requests
  ] ++ (with pkgs; [
    #
  ]);
in
import ./python-shell.nix {
  extraBuildInputs = extraBuildInputs;
  # extraLibPackages = extraLibPackages;
  myPython = myPython;
  pythonWithPkgs = pythonWithPkgs;
  pkgs = pkgs;
}

