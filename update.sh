#!/bin/sh
nix flake update
git add .
git commit -m "chore(flake.lock): update flake inputs $(date "+%H:%M:%S %d-%m-%Y")"
git push origin HEAD