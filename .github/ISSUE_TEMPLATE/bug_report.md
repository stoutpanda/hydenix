---
name: Bug Report
about: Create a report to help improve hydenix
title: '[BUG] '
labels: bug
assignees: ''
---

## Bug Description
<!-- A clear and concise description of the bug -->

## Steps to Reproduce
1. 
2. 
3. 

## Expected Behavior
<!-- What did you expect to happen? -->

## Actual Behavior
<!-- What actually happened? -->

## System Information
<details>
<summary>System Details</summary>

```bash
# Please paste the output of:
nix-shell -p nix-info --run "nix-info -m"
```
</details>

<details>
<summary>System Logs</summary>

```bash
# Please paste relevant logs from:
journalctl -b                                           # System logs
journalctl --user -b                                   # User logs
sudo systemctl status home-manager-$HOSTNAME.service   # Home-manager status
```
</details>

## Configuration
<!-- Please provide a link to your templated flake or fork -->

## Additional Context
<!-- Add any other context about the problem here -->

## Environment
- [ ] NixOS VM
- [ ] Templated Flake
- [ ] Cross-distro VM (specify: Arch/Fedora)
- [ ] Other (please specify)

## Checklist
- [ ] I have checked for existing issues
- [ ] I have included all relevant system information
- [ ] I have included relevant logs
- [ ] I have provided my configuration 