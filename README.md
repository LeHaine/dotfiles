# dotfiles
My Arch Linux dotifles.

## Main config components
- `i3` - Dynamic tiling window manager. Uses `i3-gaps`.
- `i3blocks` - A minimalist scheduler for status bar scripts.
- `irssi` - An IRC client.
- `nitrogen` - Background browser and setter.
- `ranger` - Console file manager.
- `rofi` - Window switcher, run dialog, ssh-launcher.
- `termite` - Terminal emulator


## Stow
Install `stow` using `sudo pacman -S stow`.

## Installing dotfiles
1. Navigate to the clone repo directory.
2. Execute `stow DIRNAME` for each directory to create a SymLink for the config directory.
  - Example: `stow termite` will create a link at ~/.config/termite/config"
3. Ensure the config file doesn't exist before running stow. If so delete it. The directories can exist just not the files.

## Deleting links
1. Navigate to dotfiles directory.
2. Execute command `stow -D DIRNAME` to remove links of directory.
