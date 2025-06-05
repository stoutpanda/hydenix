# HydeVM - Simplified VM Tool for HyDE Contributors

HydeVM is a streamlined development tool that automatically sets up HyDE desktop environment in a virtual machine for testing different branches and commits.

## Why?

- **Zero Configuration**: Automatically downloads Arch Linux base image and sets up HyDE
- **Branch Testing**: Easily test any HyDE branch or commit hash
- **Smart Caching**: Creates cached snapshots for faster subsequent runs
- **Optional Persistence**: Choose whether changes should be saved or discarded
- **Contributor Focused**: Designed specifically for HyDE development workflow

## Quick Start

```bash
# Test master branch (non-persistent)
hydevm

# Test a specific branch
hydevm feature-branch

# Test with persistence (changes saved)
hydevm --persist dev-branch

# Test specific commit
hydevm abc123def
```

## Usage

### Basic Commands

```bash
# Run master branch (default, non-persistent)
hydevm

# Run specific branch or commit
hydevm [branch-name|commit-hash]

# Run with persistence (changes will be saved)
hydevm --persist [branch-name|commit-hash]

# List cached snapshots
hydevm --list

# Clean all cached data
hydevm --clean

# Show help
hydevm --help
```

### Examples

```bash
# Test master branch, changes discarded on exit
hydevm

# Test development branch with persistence
hydevm --persist dev

# Test specific commit hash
hydevm a1b2c3d4

# Test feature branch, changes discarded
hydevm new-feature

# List all cached snapshots
hydevm --list

# Clean cache to start fresh
hydevm --clean
```

### Configuration

Set these environment variables to customize VM resources:

```bash
# Set VM memory (default: 4G)
VM_MEMORY=8G hydevm

# Set VM CPU count (default: 2)
VM_CPUS=4 hydevm

# Both together
VM_MEMORY=8G VM_CPUS=4 hydevm --persist dev
```

## First-Time Setup

When you run a new branch/commit for the first time, hydevm will:

1. Show a VM window with setup instructions
2. You'll need to:
   - Login as `arch` / `arch`
   - Run the provided curl command to download and execute the setup script
   - Wait for HyDE installation to complete
   - Run `sudo poweroff` to shutdown and create the snapshot

**Example first run:**

```bash
hydevm my-feature-branch
# VM opens with instructions
# Login as arch/arch, run the curl command shown
# Wait for installation, then sudo poweroff
# Snapshot is created automatically
```

**Subsequent runs are instant:**

```bash
hydevm my-feature-branch  # Uses cached snapshot - starts immediately!
```

## VM Details

- **Login**: `arch` / `arch`
- **SSH Access**: `ssh arch@localhost -p 2222`
- **Persistence**: Optional flag determines if changes are saved
- **Snapshots**: Stored in `./.hyde-cache/hydevm/snapshots/`
- **Base Image**: Cached in `./.hyde-cache/hydevm/archbase.qcow2`

## Development Workflow

```bash
# Test your feature branch
hydevm my-feature

# Make changes and test with persistence
hydevm --persist my-feature

# Test different commits
hydevm abc123  # older commit
hydevm def456  # newer commit

# Clean up when done
hydevm --clean
```

## Technical Notes

- Uses KVM acceleration when available
- Copy-on-write snapshots minimize disk usage
- Automatic branch/commit detection and checkout
- SSH port forwarding for remote access
- Non-persistent mode uses temporary overlays
