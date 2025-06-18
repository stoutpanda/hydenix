
# todo / roadmap

## now / notes

- [ ] finish demo-vm for video

## next api update

- [ ] hydenix nixOsModules to nixosModules

## priority

- [ ] refactor hydevm to arch compatible then bump to repo

- [ ] docs: better documented first edits
  - [ ] add steps for what to edit first
  - [ ] add more detailed driver

- [ ] feat: demo-vm
  - [ ] video
   - [ ]  

- [ ] feat: spicetify theme support? flatpak?

- [ ] chore: review bug template

- [ ] feat: hyprland via home-manager only
  - support plugins
  - use hyprland flake package
  - nixGL
- [ ] binary cache
- [ ] feat: experimental module exports #117

## unorganized

- [ ] BREAKING:make hydenix more extensible without losing the ability to upgrade hyde
  - [ ] hyde CORE modules
    - map a module hierachy, propose a revised api
    - modules that are required for hyde must have assertions.

## iso builder

- [ ] feat: iso builder should give a copy of the iso to the user on install
- [ ] feat: iso builder automated install should have more clear options, not just configuration.nix
- [ ] feat: iso builder should tell user exact steps of auto installer, reflect that in the readme
- [ ] fix: iso builder should prompt to edit hostname in flake.nix
- [ ] refactor: expand iso installer sections to be more clear and concise
- [ ] feat: iso installer section option to clone your own personal flake from github and use that instead of the hyde template
- [ ] feat: Completed iso builder

## config.toml integration

- [ ] feat: hyde config.toml module and options in hyde.nix
- [ ] feat: other program configuration should determine hyde config.toml options
- [ ] feat: extend hyde config.toml options for more nix integration

## hyprland.conf

- [ ] feat: more options in hyprland.nix
- [ ] feat: other program configuration should determine hyprland.conf options eg

## hypridle

- [ ] feat: hypridle module and options

## hyprlock

- [ ] feat: better hyprlock options

## uncategorized

- [ ] feat: cleanupOnDisable activation script and option

## CI

- [ ] ci: fix iso builder release flake check

## Future Enhancements

- [ ] Ecosystem
  - [ ] feat: Create sddm-hyprland
  - [ ] feat: Integrate hydepanel from rubin
  - [ ] feat: Add telegram theme support
  - [ ] feat: Add zed theme support
  - [ ] feat: Add obsidian theme support
  - [ ] feat: Add terminal-emulators support
- [ ] feat: full nixos config & full home-manager config
- [ ] feat: Set NIX-PATH to template flake location

## Non-NixOS

<https://github.com/jpikl/pm> for non-nixos packages
specific scripts for each non-nixos distro options, ideally one script for all packages using pm
nixGL wrapping for all programs, well documented in the configuration as users will need to edit it. combine with any driver setup

## Hyde repo

- [ ] theme makers should be able to precache walls before patching
  - [ ] requires arch vm (w/ commit hash param and snapshot functionality)
  - [ ] hyde-theme-starter to implement /lib with swwwallcache and wallbash
    - whatever generates dcols and wallcaches
  - [ ] hyde repo themepatcher implement reading for .cache in theme to cp cache and skip
  - [ ] validation
    - [ ] themepatcher should still generate on missing cache per wall
  - [ ] PR's for all themes to bring cache
  - [ ] hydenix implementation (just home.file mutable)
  - [ ] FUTURE: wallbash should be a seperate lib
