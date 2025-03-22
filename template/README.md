# Hydenix Template

## Intro

Now that you've created your own flake, you can start customizing the template to your liking.

1. edit `config.nix` with your preferences
2. run `sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix`
3. `git init && git add .` (flakes have to be managed via git)
4. run any of the packages in your new `flake.nix`
    - for rebuild, use `sudo nixos-rebuild switch --flake .`
    - for vm, use `nix run .`

`config.nix` is your main configuration file. It is used to set variables and import your own custom modules

## Upgrading

Hydenix can be upgraded, downgraded, or version locked easy.

in your template flake folder, update hydenix to main using
```bash
nix flake update hydenix
```

then rebuild your template flake
```bash
sudo nixos-rebuild switch --flake .
```

Hydenix might have updated api changes, compare with a new template flake to see what changed. heres a quick way to do this:
```bash
mkdir new-flake
nix flake new -t github:richen604/hydenix ./new-flake

# compare the two files, for example:
diff flake.nix new-flake/flake.nix
diff config.nix new-flake/config.nix
diff README.md new-flake/README.md
```

then make changes as needed, `rm -rf new-flake` when done

## Hydenix FAQ

### Boot option / GRUB or systemd-boot

`configuration.nix`/`modules/system`

```nix
# Boot options
hydenix.boot = {
  enable = true; # default is hydenix.enable
  useSystemdBoot = true; # default true, false for GRUB
  grubTheme = pkgs.hydenix.grub-retroboot; # default grub-retroboot, can use grub-pochita
  grubExtraConfig = ""; # additional GRUB configuration
  kernelPackages = pkgs.linuxPackages_zen; # default zen kernel
};
```

Make sure you change the boot option in your BIOS to use the GRUB option you selected.

### Home.activation

For any `home.activation` scripts, make sure the scripts run after `mutableGeneration`

```nix
home.activation = {
    example = lib.hm.dag.entryAfter [ "mutableGeneration" ] ''
        $DRY_RUN_CMD echo "example"
    '';
}
```

### Home.file

For `home.file`, reference [`home-file.nix`](https://github.com/richen604/hydenix/blob/main/hydenix/hm/home-file.nix) for files.
```nix
home.file = {
    ".config/example" = {
        source = ./example;
        force = true; # false by default
        recursive = true; # false by default
        mutable = true; # Hydenix custom, allows for files to be modified after being created. false by default
    };
}
```

Common way of using this would be to persist waybar and kitty styles.
```bash
# for waybar
cp ~/.config/waybar/config.ctl ~/path/to/flake/config.ctl
# for kitty
cp ~/.config/kitty/kitty.conf ~/path/to/flake/kitty.conf
```
Then in your `config.nix` homeModules import
```nix
home.file = {
    # waybar
    ".config/waybar/config.ctl" = {
        source = ./config.ctl; # path to your waybar config.ctl
        force = true;
        mutable = true;
    };
    # kitty
    ".config/kitty/kitty.conf" = {
        source = ./kitty.conf; # path to your kitty.conf
        force = true;
        mutable = true;
    };
}
```

### Common issues

- waybar look weird after rebuild? run `Hyde waybar reload`
- config resets on rebuild? note [readme](https://github.com/richen604/hydenix/blob/main/README.md#limitations)
- dolphin icons not showing? open `qt5ct` and set icon theme
- if you *remove* hyde themes in `config.nix`, youll have to remove them manually from `~/.config/hyde/themes`

### Requesting features

Please open a [feature request](https://github.com/richen604/hydenix/issues/new?template=feature_request.md) if you have any feature requests.

## Nix Resources

> [!TIP]
> Nix is a powerful package manager and configuration system that can be overwhelming at first. Here are some resources to help you get started:

General Resources
- [Nix Packages](https://search.nixos.org/packages)
- [Nix Options](https://search.nixos.org/options)
- [Home Manager Options](https://nix-community.github.io/home-manager/options.html) *hint: use control + f to search*
- [NixOS Wiki](https://nixos.wiki)
- [Nixpkgs Discussions](https://discourse.nixos.org)
- [Nixpkgs Issues](https://github.com/NixOS/nixpkgs/issues)
