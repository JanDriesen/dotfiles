# dotfiles

Start by cloning the repo into your home directory or another folder where you like
```
$ git clone https://github.com/JanDriesen/dotfiles.git
```

Then change in the repo folder and run the installation script
```
$ cd dotfiles && ./install.sh
```

The installation script will
+ install brew package manager
+ install oh-my-zsh
+ install dockutil via brew
+ run a macOS settings script with my system defaults, prompting before it
  overwrites the desktop wallpaper

## Structure

```
.dotfiles/
├── install.sh        # entry point, run this
├── home/              # dotfiles symlinked into $HOME
├── scripts/           # bootstrap scripts sourced by install.sh
│   └── brew/          # Homebrew self-install + package lists
└── Assets/            # binary assets referenced by the settings script
```

## Notes

- macOS ships `/bin/bash` 3.2.57 (its last GPLv2 release) and doesn't upgrade
  it even after installing a newer bash via Homebrew, unless you also change
  your default shell/PATH. All scripts here target bash 3.2 for that reason —
  notably `mapfile`/`readarray` (bash 4+) are avoided;
  `scripts/brew/install_brew.sh` reads `scripts/brew/Formulae`/
  `scripts/brew/Casks` into arrays with a `while read` loop instead.
