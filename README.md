# Nix Configuration for NixOS and macOS

This repository contains my **Nix configuration** for both **NixOS (desktop)** and **macOS (macbook)**. It uses:

* **Nix** as the package manager
* **nix-darwin** for macOS system configuration
* **Home Manager** integrated as a Nix module (not standalone)

This setup provides a unified and reproducible environment across platforms.

## Requirements

* [Nix](https://nixos.org/download) installed
* For macOS:

  * [nix-darwin](https://github.com/nix-darwin/nix-darwin)

## Installation

### Desktop (NixOS)

1. Clone this repository:

   ```sh
   git clone https://github.com/bronstedk/nix-config.git ~/nix-config
   cd ~/nix-config
   ```

2. Rebuild system with Home Manager integrated:

   ```sh
   sudo nixos-rebuild switch --flake ~/nix-config#desktop
   ```

### Macbook (macOS)

1. Install Nix using the **Determinate Systems installer**:

   ```sh
   curl -fsSL https://install.determinate.systems/nix | sh -s -- install
   ```

   > **Note:** The Determinate Systems installer may prompt you to install their **special fork of Nix**. You must **decline this** and use only the standard Nix provided by the installer. Absolutely do **not** install the special Determinate Nix package.

2. Clone this repository:

   ```sh
   git clone https://github.com/bronstedk/nix-config.git ~/nix-config
   cd ~/nix-config
   ```

3. Install nix-darwin with your configuration:

   ```sh
   sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/nix-config#macbook
   ```

4. After installation, switch generations with:

   ```sh
   sudo darwin-rebuild switch --flake ~/nix-config#macbook
   ```

## Structure

* `flake.nix` — main entrypoint for configurations
* `nixos/` — NixOS-specific configs
* `darwin/` — macOS-specific configs
* `home/` — Home Manager modules, imported directly into system configs

## Usage

After editing configuration files:

```sh
nix flake update
sudo nixos-rebuild switch --flake ~/nix-config#desktop                  # NixOS (desktop)
sudo darwin-rebuild switch --flake ~/nix-config#macbook                 # macOS (macbook)
```

## Notes

* Home Manager is used **as a Nix module**, not via `home-manager switch`.
* System-specific logic is separated but shares a common flake structure.
* Provides consistent package, service, and dotfile management across NixOS and macOS.
