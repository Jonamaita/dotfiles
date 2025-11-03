# dotfiles

This repository contains my personal dotfiles and the configurations for my development workflow.

## 🛠️ Software Stack

I currently use the following tools:

* **Neovim** (v0.11.2 or later) - My primary text editor.
* **KMonad** - For advanced keyboard remapping.
* **tmux** - For managing multiple terminal sessions.

## Common files

The simple way to 'install' the '.config' files:

1. Obviously clone this repo.
2. Use the `stow` Linux command to create symlinks.
3. So in the root of this repo execute `stow common/`, the command will create symlinks for all folders in the `.config` folder.
