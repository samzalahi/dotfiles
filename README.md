# Dotfiles

This repository contains configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

---

## 1. Prerequisites

Ensure `stow` is installed on your system:

### Arch Linux
```bash
sudo pacman -S stow
```

### Debian / Ubuntu
```bash
sudo apt update && sudo apt install stow
```

### Fedora
```bash
sudo dnf install stow
```

## 2. Installation

Clone this repository to your home directory:

```bash
cd ~
git clone https://github.com/yourusername/dotfiles.git
cd dotfiles
```

## 3. Applying Configurations

To apply a specific configuration, run `stow` followed by the directory name:

```bash
stow hyperland
```

To apply all configurations at once:

```bash
stow */
```

## 4. Handling Conflicts

If you have existing configuration files, `stow` might fail. You can either:

1. **Delete or move** the existing files and run `stow` again.
2. Use the **adopt** flag to incorporate existing files into the dotfiles repository(Recommended):

```bash
# Adopt the files: This moves existing config files into your dotfiles repo 
# (replacing your versions locally) and creates the symlinks.
stow --adopt *

# Inspect differences: Use this to see what defaults changed in your repo.
git diff

# Overwrite with your repo: If you want your original repo's settings, 
# discard the adopted changes.
git reset --hard
```
