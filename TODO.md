---

kanban-plugin: list

---

## Bugs

- [ ] fix: iso builder leaves erroroneos efi boot entries
- [ ] fix: boot module grub is not working?

## Features

- [ ] feat: iso builder should give a copy of the iso to the user on install
- [ ] feat: iso builder automated install should have more clear options, not just configuration.nix
- [ ] feat: hyde config.toml module and options in hyde.nix
- [ ] feat: other program configuration should determine hyde config.toml options
- [ ] feat: other program modules should change hyprland.conf as variables are set there
- [ ] feat: hypridle module and options
- [ ] feat: better hyprlock options
- [ ] feat: is code the default EDITOR?

## CI

- [ ] feat: confirm iso builder on release is working

## Future Enhancements

- [ ] feat: Complete iso builder
- [ ] Ecosystem
  - [ ] feat: Add spicetify support
  - [ ] feat: Create sddm-hyprland
  - [ ] feat: Develop hyprpanel
  - [ ] feat: Integrate hydepanel from rubin
  - [ ] feat: Add telegram theme support
  - [ ] feat: Add zed theme support
  - [ ] feat: Add obsidian theme support
  - [ ] feat: Add terminal-emulators support
  - [ ] feat: Add updated HyDE/code-wallbash nix support
- [ ] hyde themes should precache things, there is no reason each user should have to build cache
This will heavily improve performance of first boot, as swwwallcache is not built
This feature would be outside of hydenix, most likely a PR to both theme maintainers and hyde
- [ ] feat: Set NIX-PATH to template flake location
- [ ] feat: Add home-manager only configuration with nixGL
- [ ] chore: Review non-nix VM support

%% kanban:settings
```
{"kanban-plugin":"list","list-collapse":[true,false,false,false,true,false],"show-checkboxes":true,"lane-width":600,"full-list-lane-width":true}
```
%%