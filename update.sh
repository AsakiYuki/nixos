#!/bin/sh
nix flake update
git add .
git commit -m "chore(flake.lock): update flake inputs $(date +%d/%m/%y)"
git push origin HEAD