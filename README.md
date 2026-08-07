# dotfiles

Personal macOS setup: shell config, Homebrew packages, and system defaults,
bootstrapped from a single script.

## Quick start

Clone the repo into your home directory (or wherever you like):

```sh
git clone https://github.com/JanDriesen/dotfiles.git
cd dotfiles && ./install.sh
```

The install script will prompt for your password once, then:

- Install Homebrew (if missing) and everything listed in
  `scripts/brew/Formulae` / `scripts/brew/Casks`
- Install Ruby via `rbenv` and a few gems (`cocoapods`, `fastlane`, `xcodeproj`)
- Install `oh-my-zsh`
- Symlink the files in `home/` into `$HOME`
- Apply macOS system defaults from `scripts/install_settings.sh`,
  prompting before it overwrites the desktop wallpaper

### Manual steps after install

A few things aren't automated on purpose:

- Set display scaling to "More Space" (System Settings → Displays)
- Download App Store-only apps: Magnet, HazeOver, Xcode, etc.
- Start Docker Desktop once manually (no account needed — skip/close the
  sign-in prompt)
- Enable Kubernetes in Docker Desktop: **Settings → Kubernetes → Enable
  Kubernetes → Apply & Restart**

## Structure

```
.dotfiles/
├── install.sh       # entry point, run this
├── home/             # dotfiles symlinked into $HOME
├── scripts/          # bootstrap scripts sourced by install.sh
│   └── brew/         # Homebrew self-install + package lists
└── Assets/           # binary assets referenced by the settings script
```

## Notes

- macOS ships `/bin/bash` 3.2.57 (its last GPLv2 release) and doesn't upgrade
  it even after installing a newer bash via Homebrew, unless you also change
  your default shell/PATH. All scripts here target bash 3.2 for that reason —
  notably `mapfile`/`readarray` (bash 4+) are avoided;
  `scripts/brew/install_brew.sh` reads `scripts/brew/Formulae`/
  `scripts/brew/Casks` into arrays with a `while read` loop instead.
- `home/.zshrc` includes a `nosleep-toggle` function that flips
  `pmset -a disablesleep` on/off, for quickly switching between "stay awake"
  (long builds/downloads) and normal power behavior.
