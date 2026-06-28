#!/bin/sh
nix flake update
git add .
git commit -m "update lock file $(date +%d/%m/%y)"
git push origin HEAD
./build.sh $1