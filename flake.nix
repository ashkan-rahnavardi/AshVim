{
  description = "Ash's NeoVim configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };
  outputs = {
    nixvim,
    flake-parts,
    rust-overlay,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {system, ...}: let
        overlays = [(import rust-overlay)];
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        baseNixvimModule = {
          inherit pkgs;
          module = {pkgs, ...}: {
            imports = [
              ./config
              ./config/javascript
              ./config/php
            ];
            extraPackages = with pkgs; [
              sops
              # php82Packages.php-cs-fixer
              shfmt
              nodejs_22 # node runtime needed for Augment Code to work
              eslint
            ];
          };
          extraSpecialArgs = {};
        };
        rustNixvimModule = {
          inherit pkgs;
          module = {pkgs, ...}: {
            imports = [
              ./config
              ./config/rust
            ];
            extraPackages = with pkgs; [
              sops
              shfmt
              rust-bin.stable.latest.default
              nodejs_22
            ];
          };
          extraSpecialArgs = {};
        };
        csharpNixvimModule = {
          inherit pkgs;
          module = {pkgs, ...}: {
            imports = [
              ./config
              ./config/csharp
            ];
            extraPackages = with pkgs; [
              sops
              shfmt
              nodejs_22
            ];
          };
          extraSpecialArgs = {};
        };
        goNixvimModule = {
          inherit pkgs;
          module = {pkgs, ...}: {
            imports = [
              ./config
              ./config/golang
            ];
            extraPackages = with pkgs; [
              sops
              shfmt
              nodejs_22
            ];
          };
          extraSpecialArgs = {};
        };
        pythonNixvimModule = {
          inherit pkgs;
          module = {pkgs, ...}: {
            imports = [
              ./config
              ./config/python
            ];
            extraPackages = with pkgs; [
              sops
              shfmt
              nodejs_22
            ];
          };
          extraSpecialArgs = {};
        };
        javascriptNixvimModule = {
          inherit pkgs;
          module = {pkgs, ...}: {
            imports = [
              ./config
              ./config/javascript
            ];
            extraPackages = with pkgs; [
              sops
              shfmt
              nodejs_22
            ];
          };
          extraSpecialArgs = {};
        };
        phpNixvimModule = {
          inherit pkgs;
          module = {pkgs, ...}: {
            imports = [
              ./config
              ./config/php
            ];
            extraPackages = with pkgs; [
              shfmt
              # php82Packages.php-cs-fixer
              nodejs_22
            ];
          };
          extraSpecialArgs = {};
        };
        # iacNixvimModule = {
        #   inherit pkgs;
        #   module = {pkgs, ...}: {
        #     imports = [
        #       ./config
        #       ./config/iac
        #     ];
        #     extraPackages = with pkgs; [sops ansible-lint];
        #   };
        #   extraSpecialArgs = {};
        # };
        pkgs = import inputs.nixpkgs {
          inherit system overlays;
          config.allowUnfree = true;
        };
        baseNvim = nixvim'.makeNixvimWithModule baseNixvimModule;
        rustNvim = nixvim'.makeNixvimWithModule rustNixvimModule;
        csharpNvim = nixvim'.makeNixvimWithModule csharpNixvimModule;
        goNvim = nixvim'.makeNixvimWithModule goNixvimModule;
        pythonNvim = nixvim'.makeNixvimWithModule pythonNixvimModule;
        javascriptNvim = nixvim'.makeNixvimWithModule javascriptNixvimModule;
        phpNvim = nixvim'.makeNixvimWithModule phpNixvimModule;
        # iacNvim = nixvim'.makeNixvimWithModule iacNixvimModule;
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvimLib.check.mkTestDerivationFromNixvimModule baseNixvimModule;
        };
        packages = {
          # Lets you run `nix run .` to start nixvim
          default = baseNvim;
          # Lets you run `nix run .#rust` to start nixvim with Rust configuration
          rust = rustNvim;
          # Lets you run `nix run .#csharp` to start nixvim with C# configuration
          csharp = csharpNvim;
          # Lets you run `nix run .#golang` to start nixvim with Go configuration
          golang = goNvim;
          # Lets you run `nix run .#python` to start nixvim with Python configuration
          python = pythonNvim;
          # Lets you run `nix run .#javascript` to start nixvim with JS/TS configuration
          javascript = javascriptNvim;
          # Lets you run `nix run .#javascript` to start nixvim with IaC configuration
          # iac = iacNvim;
          php = phpNvim;
        };
      };
    };
}
