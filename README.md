<p align="center">
  <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/refs/heads/master/logo/nix-snowflake-colours.svg" width="100" />
</p>

<h1 align="center">❄️ AsakiYuki's NixOS</h1>

<p align="center">
  <em>Modular, multi-device NixOS configuration powered by Flakes</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/nixos-26.05-5277c3?style=for-the-badge&logo=nixos&logoColor=white&labelColor=000000" />
  <img src="https://img.shields.io/badge/license-GPL--3.0-green?style=for-the-badge&labelColor=000000" />
</p>

---

## 🖥️ Devices

| Target | Description |
|:---|:---|
| `ideapad-slim-5` | Lenovo IdeaPad Slim 5 — Full desktop (KDE Plasma, Hyprland, Niri) |
| `home-server` | Headless server (Forgejo, Nginx, Nextcloud, SearX, AdGuard Home) |
| `wsl` | WSL — Lightweight CLI environment |

---

## 📂 Structure

```
.
├── flake.nix              # Entrypoint
├── devices/               # Per-device configs (hardware, boot, services)
├── host/                  # Shared presets (desktop / server)
├── users/                 # Per-user declarations (asakiyuki, hieze, junko)
├── modules/               # Reusable NixOS & Home Manager modules
├── options/               # Custom option declarations (device.dm.*, device.de.*, etc.)
├── helpers/               # Lib extensions (mkUsers, mkProgramOption, etc.)
├── overlays/              # Nixpkgs overlays
├── flakes/                # Internal sub-flakes (cursors, custom packages)
├── assets/                # Static assets, public keys, encrypted secrets
├── secrets.nix            # Agenix secret declarations
├── build.sh               # Quick rebuild
├── install.sh             # Fresh install
└── agenix.sh              # Secret management helper
```

---

## 🚀 Usage

### Build & Switch

```bash
# Clone to /etc/nixos, then:
./build.sh <target>

# Examples:
./build.sh ideapad-slim-5
./build.sh home-server
./build.sh wsl
```

### Fresh Install

```bash
./install.sh <target>
```

### Flake Commands

```bash
nix build .#nixosConfigurations.<target>.config.system.build.toplevel
nix flake check
nix flake update
nix flake show
```

### Secrets (Agenix)

```bash
# Edit a secret
./agenix.sh -e assets/secrets/services/cloudflare.secret.age

# Re-key all secrets
./agenix.sh -r
```

> `secret.key` must be present locally (git-ignored).

### Sub-flakes

This repo ships two standalone sub-flakes you can use independently in your own config:

#### 🖱️ Custom Cursors (`flakes/cursors`)

A Home Manager module providing anime-themed cursor packs (Honkai, Wuthering Waves, etc.).

```nix
# flake.nix
{
  inputs.cursors.url = "github:asakiyuki/nixos?dir=flakes/cursors";

  # In your Home Manager config:
  # imports = [ inputs.cursors.homeModules.default ];
}
```

```nix
# home.nix
{
  theme.cursors = "elysia"; # or: castorice, aemeath, denia, cartethyia, yangyang, hiyuki, lucilla
}
```

#### 📦 Custom Packages Overlay (`flakes/overlays`)

Adds `cage-xtmapper`, `cider-2`, `bun-baseline`, `geode-cli`, `lsfg-vk` to nixpkgs.

```nix
# flake.nix
{
  inputs.asa-overlay.url = "github:asakiyuki/nixos?dir=flakes/overlays";
}
```

```nix
# configuration.nix
{
  nixpkgs.overlays = [ inputs.asa-overlay.overlays.default ];

  environment.systemPackages = with pkgs; [
    cider-2
    geode-cli
    # ...
  ];
}
```

---

## 🧱 Architecture

```mermaid
graph TD
    A["flake.nix"] --> B["helpers/nixosConfigurations.nix"]
    B --> C["ideapad-slim-5"]
    B --> D["home-server"]
    B --> E["wsl"]

    C --> F["host/desktop"]
    D --> G["host/server"]
    E --> H["NixOS-WSL"]

    F --> I["modules/*"]
    G --> I

    style A fill:#5277c3,stroke:#333,color:#fff
    style C fill:#7eb356,stroke:#333,color:#fff
    style D fill:#e06c75,stroke:#333,color:#fff
    style E fill:#d19a66,stroke:#333,color:#fff
```

`helpers/nixosConfigurations.nix` takes device definitions from `flake.nix` and wires up extended `lib`, unstable channel, Home Manager, agenix, Chaotic-Nyx, and all shared modules automatically.

---

## 📄 License

[GPL-3.0](./LICENSE)
