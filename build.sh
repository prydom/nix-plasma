#!/bin/bash
set -e
nix-build -o build/opengl-driver graphics-env.nix
nix-build -o build/system system.nix
nix-build -o build/etc etc.nix
nix-build -o build/nix-plasma system-path.nix
nix-build -o build/environment-vars environment-vars.nix
