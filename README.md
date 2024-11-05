###### *<div align="right"><sub>// design by t2</sub></div>*


<div align = center>
    <a href="https://discord.gg/AYbJ9MJez7">
<img alt="Dynamic JSON Badge" src="https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fdiscordapp.com%2Fapi%2Finvites%2FmT5YqjaJFh%3Fwith_counts%3Dtrue&query=%24.approximate_member_count&suffix=%20members&style=for-the-badge&logo=discord&logoSize=auto&label=The%20HyDe%20Project&labelColor=ebbcba&color=c79bf0">
    </a>
</div>

<!--
<img alt="Dynamic JSON Badge" src="https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fdiscordapp.com%2Fapi%2Finvites%2FmT5YqjaJFh%3Fwith_counts%3Dtrue&query=%24.approximate_member_count&suffix=%20members&style=for-the-badge&logo=discord&logoSize=auto&label=The%20HyDe%20Project&labelColor=ebbcba&color=c79bf0">

<img alt="Dynamic JSON Badge" src="https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fdiscordapp.com%2Fapi%2Finvites%2FmT5YqjaJFh%3Fwith_counts%3Dtrue&query=%24.approximate_presence_count&suffix=%20online&style=for-the-badge&logo=discord&logoSize=auto&label=The%20HyDe%20Project&labelColor=ebbcba&color=c79bf0">
-->

<div align="center">

 ![hyde_banner](https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/hyde_banner.png)

<br>

  <a href="#installation-options"><kbd> <br> Installation <br> </kbd></a>&ensp;
  <a href="#themes"><kbd> <br> Themes <br> </kbd></a>&ensp;
  <a href="#styles"><kbd> <br> Styles <br> </kbd></a>&ensp;
  <a href="#keybindings"><kbd> <br> Keybindings <br> </kbd></a>&ensp;
    <a href="#troubleshooting--issues"><kbd> <br> Issues <br> </kbd></a>&ensp;
      <a href="#faq"><kbd> <br> FAQ <br> </kbd></a>&ensp;
        <a href="#keybindings"><kbd> <br> Keybindings <br> </kbd></a>&ensp;
  <a href="https://www.youtube.com/watch?v=2rWqdKU1vu8&list=PLt8rU_ebLsc5yEHUVsAQTqokIBMtx3RFY&index=1"><kbd> <br> Youtube <br> </kbd></a>&ensp;
  <a href="https://discord.gg/qWehcFJxPa"><kbd> <br> Discord <br> </kbd></a>

</div><br><br>

<video controls src="https://private-user-images.githubusercontent.com/106020512/324331744-7f8fadc8-e293-4482-a851-e9c6464f5265.mp4?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzAxNzIwODEsIm5iZiI6MTczMDE3MTc4MSwicGF0aCI6Ii8xMDYwMjA1MTIvMzI0MzMxNzQ0LTdmOGZhZGM4LWUyOTMtNDQ4Mi1hODUxLWU5YzY0NjRmNTI2NS5tcDQ_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI5JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyOVQwMzE2MjFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT03YTBiNDVjZThhZjU4NmY1MTc4NTRjYzEyZTBmYjRmZjI0YTY0ZTIyNWU2NTlhMTBkZmIxOWFlOWQ0YzQ5YTAyJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.cTLUInzudFw4tmHUS1K32e6hx3umv84Ka2sDCuzrUig" title="https://github.com/prasanthrangan/hyprdots/assets/106020512/7f8fadc8-e293-4482-a851-e9c6464f5265"></video>

<br><div align="center"><img width="18%" src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/arch.png"/> <img style="margin-right: 10px" width="16%" src="https://em-content.zobj.net/source/apple/391/handshake_1f91d.png">&ensp;&ensp;&ensp;<img width="16.5%" src="https://github.com/NixOS/nixos-artwork/raw/refs/heads/master/logo/nix-snowflake-colours.svg"/></div>

# Hydenix

Hydenix is a Nix & home-manager configuration for [HyDE](https://github.com/prasanthrangan/hyprdots). 
The nix ecosystem brings a reproducable environment to the HyDE experience; allowing for build-time configuration options, easy updates, and more.

Features:
- Includes [HyDE-cli](https://github.com/HyDE-Project/Hyde-cli) by default
- NixOS VM that can be run with any supported distro
- Themes are fetched at build-time, for faster setup
- Includes **beta cross-distro** support using home-manager, more on that [here](##installation-options). 

Why Nix?:
- Reproducible environment
- Easy to manage packages, dependencies, and configurations
- changes in configuration can be rolled back easily
- home-manager for managing dotfiles

> [!NOTE]
> If you are new to Nix, please refer to the [Nix Resources](##Nix-Resources).

---

## Limitations

- Some Hyde-cli commands are not supported yet
  - `Hyde theme import` I've had this fail off and on, working on a fix
  - `Hyde restore/backup/control` while these commands will work, hydenix makes edits to hyde files by default. currently not recommended
  - `Hyde override` changing the user dir conflics with home-manager, rebuilds won't run as expected
  - `Hyde sddm` sddm is not supported yet
  - `Hyde inject` not supported
- Any other issues that don't match base HyDE config, see [Troubleshooting & Issues](#troubleshooting--issues)

## Requirements

- nix pkg manager: i recommend using the [nix-installer from DeterminateSystems](https://github.com/DeterminateSystems/nix-installer)
- git (`nix-shell -p git`)

---

## Installation Options

#### 1. Running as a VM

If your system supports it, the NixOS VM is the quickest way to get up and running. 
If you have issues running the VM, see the [virtio faq](#vm-virtio-guide)


```bash
# run the flake remotely
nix run github:richen604/hydenix

# or clone the repo
git clone https://github.com/richen604/hydenix.git && cd hydenix
nix run .
```

> **note:** any changes require the vm to be rebuilt. run `rm hydenix.qcow2` to remove the old one.

---

> [!CAUTION]
> Installation options below are designed for a minimal install of NixOS.

#### 2. Clone the repo

1. clone this repository:

   ```bash
   git clone https://github.com/richen604/hydenix.git && cd hydenix
   ```
2. edit `config.nix` and `hosts/nixos/home.nix` with your preferences
> customizations outside of config.nix & hydenix in home.nix will have limited support

1. generate hardware configuration:

   ```bash
   sudo nixos-generate-config --show-hardware-config > ./hosts/nixos/hardware-configuration.nix
   ```

 2. run the flake:

    ```bash
    sudo nixos-rebuild switch --flake .#hydenix
    ```

#### 3. (BETA) Cross-distro VMs

Currently Arch & Fedora VMs are supported
Same VM requirements as [VM virtio guide](#vm-virtio-guide)

```bash
nix run github:richen604/hydenix/#build-fedora-vm # or #build-arch-vm

# after the vm is built, run the flake from the vm
nix run github:richen604/hydenix/#run-fedora-vm # or #run-arch-vm
```

## Themes

All our official themes are stored in a separate repository, allowing users to install them using themepatcher.
For more information, visit [prasanthrangan/hyde-themes](https://github.com/prasanthrangan/hyde-themes).

<div align="center">
  <table><tr><td>

[![Catppuccin-Latte](https://placehold.co/130x30/dd7878/eff1f5?text=Catppuccin-Latte&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Catppuccin-Latte)
[![Catppuccin-Mocha](https://placehold.co/130x30/b4befe/11111b?text=Catppuccin-Mocha&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Catppuccin-Mocha)
[![Decay-Green](https://placehold.co/130x30/90ceaa/151720?text=Decay-Green&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Decay-Green)
[![Edge-Runner](https://placehold.co/130x30/fada16/000000?text=Edge-Runner&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Edge-Runner)
[![Frosted-Glass](https://placehold.co/130x30/7ed6ff/1e4c84?text=Frosted-Glass&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Frosted-Glass)
[![Graphite-Mono](https://placehold.co/130x30/a6a6a6/262626?text=Graphite-Mono&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Graphite-Mono)
[![Gruvbox-Retro](https://placehold.co/130x30/475437/B5CC97?text=Gruvbox-Retro&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Gruvbox-Retro)
[![Material-Sakura](https://placehold.co/130x30/f2e9e1/b4637a?text=Material-Sakura&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Material-Sakura)
[![Nordic-Blue](https://placehold.co/130x30/D9D9D9/476A84?text=Nordic-Blue&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Nordic-Blue)
[![Rosé-Pine](https://placehold.co/130x30/c4a7e7/191724?text=Rosé-Pine&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Rose-Pine)
[![Synth-Wave](https://placehold.co/130x30/495495/ff7edb?text=Synth-Wave&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Synth-Wave)
[![Tokyo-Night](https://placehold.co/130x30/7aa2f7/24283b?text=Tokyo-Night&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Tokyo-Night)

  </td></tr></table>
</div>

> [!TIP]
> Everyone, including you can create, maintain, and share additional themes, all of which can be installed using themepatcher!
> To create your own custom theme, please refer to the [theming wiki](https://github.com/prasanthrangan/hyprdots/wiki/Theming).
> If you wish to have your hyde theme showcased, or you want to find some non-official themes, visit [kRHYME7/hyde-gallery](https://github.com/kRHYME7/hyde-gallery)!

<div align="right">
  <br>
  <a href="#"><kbd> <br> 🡅 <br> </kbd></a>
</div>

## Styles

<div align="center"><table><tr>Theme Select</tr><tr><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_select_1.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/theme_select_2.png"/></td></tr></table></div>

<div align="center"><table><tr><td>Wallpaper Select</td><td>Launcher Select</td></tr><tr><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/walls_select.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_sel.png"/></td></tr>
<tr><td>Wallbash Modes</td><td>Notification Action</td></tr><tr><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/wb_mode_sel.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/notif_action_sel.png"/></td></tr>
</table></div>

<div align="center"><table><tr>Rofi Launcher</tr><tr><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_1.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_2.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_3.png"/></td></tr><tr><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_4.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_5.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_6.png"/></td></tr><tr><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_7.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_8.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_9.png"/></td></tr><tr><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_10.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_11.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/rofi_style_12.png"/></td></tr>
</table></div>

<div align="center"><table><tr>Wlogout Menu</tr><tr><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/wlog_style_1.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/wlog_style_2.png"/></td></tr></table></div>

<div align="center"><table><tr>Game Launcher</tr><tr><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/game_launch_1.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/game_launch_2.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/game_launch_3.png"/></td></tr></table></div>
<div align="center"><table><tr><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/game_launch_4.png"/></td><td>
<img src="https://raw.githubusercontent.com/prasanthrangan/hyprdots/main/Source/assets/game_launch_5.png"/></td></tr></table></div>

<div align="right">
  <br>
  <a href="#"><kbd> <br> 🡅 <br> </kbd></a>
</div>

## Keybindings

<div align="center">

| Keys | Action |
| :--- | :--- |
| <kbd>Super</kbd> + <kbd>Q</kbd><br><kbd>Alt</kbd> + <kbd>F4</kbd> | Close focused window|
| <kbd>Super</kbd> + <kbd>Del</kbd> | Kill Hyprland session |
| <kbd>Super</kbd> + <kbd>W</kbd> | Toggle the window between focus and float |
| <kbd>Super</kbd> + <kbd>G</kbd> | Toggle the window between focus and group |
| <kbd>Super</kbd> + <kbd>slash</kbd> | Launch keybinds hint |
| <kbd>Alt</kbd> + <kbd>Enter</kbd> | Toggle the window between focus and fullscreen |
| <kbd>Super</kbd> + <kbd>L</kbd> | Launch lock screen |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd> | Toggle pin on focused window |
| <kbd>Super</kbd> + <kbd>Backspace</kbd> | Launch logout menu |
| <kbd>Ctrl</kbd> + <kbd>Esc</kbd> | Toggle waybar |
| <kbd>Super</kbd> + <kbd>T</kbd> | Launch terminal emulator (kitty) |
| <kbd>Super</kbd> + <kbd>E</kbd> | Launch file manager (dolphin) |
| <kbd>Super</kbd> + <kbd>C</kbd> | Launch text editor (vscode) |
| <kbd>Super</kbd> + <kbd>F</kbd> | Launch web browser (firefox) |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Esc</kbd> | Launch system monitor (htop/btop or fallback to top) |
| <kbd>Super</kbd> + <kbd>A</kbd> | Launch application launcher (rofi) |
| <kbd>Super</kbd> + <kbd>Tab</kbd> | Launch window switcher (rofi) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>E</kbd> | Launch file explorer (rofi) |
| <kbd>F10</kbd> | Toggle audio mute |
| <kbd>F11</kbd> | Decrease volume |
| <kbd>F12</kbd> | Increase volume |
| <kbd>Super</kbd> + <kbd>P</kbd> | Partial screenshot capture |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>P</kbd> | Partial screenshot capture (frozen screen) |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>P</kbd> | Monitor screenshot capture |
| <kbd>PrtScn</kbd> | All monitors screenshot capture |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>G</kbd> | Disable hypr effects for gamemode |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>→</kbd><kbd>←</kbd> | Cycle wallpaper |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>↑</kbd><kbd>↓</kbd> | Cycle waybar mode |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd> | Launch wallbash mode select menu (rofi) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>T</kbd> | Launch theme select menu (rofi) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>A</kbd> | Launch style select menu (rofi) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd> | Launch wallpaper select menu (rofi) |
| <kbd>Super</kbd> + <kbd>V</kbd> | Launch clipboard (rofi) |
| <kbd>Super</kbd> + <kbd>K</kbd> | Switch keyboard layout |
| <kbd>Super</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd> | Move window focus |
| <kbd>Alt</kbd> + <kbd>Tab</kbd> | Change window focus |
| <kbd>Super</kbd> + <kbd>[0-9]</kbd> | Switch workspaces |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>←</kbd><kbd>→</kbd> | Switch workspaces to a relative workspace |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>↓</kbd> | Move to the first empty workspace |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd> | Resize windows |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>[0-9]</kbd> | Move focused window to a relative workspace |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Ctrl</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd> | Move focused window (tiled/floating) around the current workspace |
| <kbd>Super</kbd> + <kbd>MouseScroll</kbd> | Scroll through existing workspaces |
| <kbd>Super</kbd> + <kbd>LeftClick</kbd><br><kbd>Super</kbd> + <kbd>Z</kbd> | Move focused window |
| <kbd>Super</kbd> + <kbd>RightClick</kbd><br><kbd>Super</kbd> + <kbd>X</kbd> | Resize focused window |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>S</kbd> | Move/Switch to special workspace (scratchpad) |
| <kbd>Super</kbd> + <kbd>S</kbd> | Toggle to special workspace |
| <kbd>Super</kbd> + <kbd>J</kbd> | Toggle focused window split |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>[0-9]</kbd> | Move focused window to a workspace silently |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>H</kbd> | Move between grouped windows backward |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>L</kbd> | Move between grouped windows forward |


</div>
<br>

<div align="right">
  <br>
  <a href="#"><kbd> <br> 🡅 <br> </kbd></a>
</div>


## TODO

- [x] sddm themes 
- [x] revamp global config.nix to support home-manager options
- [ ] add hyde.conf params to home-manager config
- [ ] better home-manager module + install options
- [ ] wallbash 
  - [ ] spotify - via flatpak and spicetify 
  - [ ] vesktop/webcord etc
  - [ ] cava
- [ ] minimize all home.file calls for performance
- [ ] Cross-distro support
  - [ ] Arch & Base HyDE VM for testing
  - [ ] Fedora
  - [ ] MacOS via nix-darwin and OSX-KVM

Future:
- [ ] remove nixGL in support for system-manager and nix-system-graphics

## Troubleshooting & Issues

- if you encounter any issues, please check the nixos and home manager logs:
  ```bash
  journalctl -b
  journalctl --user -b
  sudo systemctl status home-manager-<hostname>.service
  ```
- if running nixos on host, please run `nix-shell -p nix-info --run "nix-info -m"` and paste the result.

<div align="right">
  <br>
  <a href="#"><kbd> <br> 🡅 <br> </kbd></a>
</div>

## FAQ

#### VM Virtio guide

Hyprland vm is not well supported. check out [Hyprland - Running in a VM](https://wiki.hyprland.org/Getting-Started/Installation/#running-in-a-vm)

Best bet is to have virtio, opengl, and VT-x support

Non-NixOS hosts should run with [nixGL](https://github.com/nix-community/nixGL) eg `nixGL nix run .`

CPU
- Intel CPU with VT-x or AMD CPU with AMD-V
- Virtualization enabled in BIOS/UEFI

GPU
- NVIDIA: GTX 600+ series (proprietary drivers)
- AMD: HD 7000+ series
- Intel: HD 4000+ (Ivy Bridge)
- OpenGL 3.3+ support required

Install Drivers
```bash
# Nvidia
sudo apt install nvidia-driver nvidia-utils     # Debian/Ubuntu
sudo pacman -S nvidia nvidia-utils              # Arch

# AMD
sudo apt install mesa-utils vulkan-tools        # Debian/Ubuntu
sudo pacman -S mesa lib32-mesa vulkan-radeon    # Arch

# Intel
sudo apt install mesa-utils intel-media-va-driver  # Debian/Ubuntu
sudo pacman -S mesa lib32-mesa intel-media-driver  # Arch

# KVM modprobe
modprobe kvm
modprobe kvm_intel # or kvm_amd
```

Add user to groups
`sudo usermod -a -G render,video,kvm,libvirt $USER`

Verify Setup

```bash
# Verify KVM support
egrep -c '(vmx|svm)' /proc/cpuinfo    # Should return > 0
lsmod | grep kvm                       # Check KVM modules

# Host: Check OpenGL
glxinfo | grep "OpenGL"
```
<div align="right">
  <br>
  <a href="#"><kbd> <br> 🡅 <br> </kbd></a>
</div>

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

<div align="right">
  <br>
  <a href="#"><kbd> <br> 🡅 <br> </kbd></a>
</div>

## Contributing

This project enforces [Conventional Commits](https://www.conventionalcommits.org/) format for all commit messages. Each commit message must follow this structure:

```
type(optional-scope): subject

[optional body]

[optional footer(s)]
```

Where:
- **type** must be one of:
  - `feat`: A new feature
  - `fix`: A bug fix
  - `docs`: Documentation changes
  - `style`: Code style changes (formatting, etc)
  - `refactor`: Code changes that neither fix bugs nor add features
  - `perf`: Performance improvements
  - `test`: Adding or modifying tests
  - `chore`: Maintenance tasks

- **scope** is optional but if used:
  - must be lowercase
  - should be descriptive of the area of change
  - examples: vm, themes, home, cli, docs, etc.

- **subject** must:
  - be lowercase
  - not end with a period
  - be descriptive

Examples:
- `feat(vm): add support for fedora vm configuration`
- `fix: correct wallpaper path in material theme`
- `docs: update installation instructions`
- `chore: update dependencies`

### Pull Requests

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes using conventional commits
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Changelog

The changelog is automatically generated from commit messages. Clear, well-formatted commit messages ensure your changes are properly documented.

For more details, see the [Conventional Commits specification](https://www.conventionalcommits.org/).
