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

## 4. Handling Conflicts on OS Fresh Install 

If you have existing configuration files, `stow` might fail. So you have to **move** the existing files and run `stow` again:

Run the **dotSync.sh** to move the existing files into backup .config folder:

```bash
# Make it executable:
chmod +x dotSync.sh

# To move your dotfiles (and safely backup defaults):
./dotSync.sh move

# Run stow to symlink your dotfiles:
stow */

# To wipe your custom configs and go back to stock configs:
./dotSync.sh restore
```
