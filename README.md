# MacBook

Personal macOS bootstrap and configuration.

## Quick start

```sh
# From this repo root
./scripts/bootstrap.sh
```

## Profiles (interactive)

When you run the bootstrap, you will choose one profile:

1) Web Dev
   - Full-stack toolkit for building and deploying apps.
   - Includes Node, Python, Go, Rust, Docker, Postman, VS Code.
   - Best for daily development work.

2) Teaching
   - Teaching + live demo toolkit with lightweight CLI.
   - Includes Zoom, OBS, Slack, VS Code, plus core CLI tools.
   - Best for classes, workshops, and presentations.

3) Minimal
   - Small, fast base: core CLI + VS Code + iTerm2.
   - Best for a clean baseline or later customization.

## Examples (7)

```sh
# 1) Run full bootstrap with interactive profile selection
./scripts/bootstrap.sh

# 2) Use the Web Dev Brewfile directly
BREWFILE=./Brewfile.webdev ./scripts/brew.sh

# 3) Use the Teaching Brewfile directly
BREWFILE=./Brewfile.teaching ./scripts/brew.sh

# 4) Use Minimal set (default Brewfile)
./scripts/brew.sh

# 5) Re-apply macOS defaults only
./scripts/macos-defaults.sh

# 6) Apply presentation defaults (Dock size, visibility, etc.)
./scripts/macos-defaults-presentation.sh

# 7) Apply iTerm2 profile + Rectangle tweaks only
./scripts/iterm2-setup.sh
./scripts/rectangle-setup.sh
```

## What this does

- Installs Xcode Command Line Tools
- Installs Homebrew and packages from a selected Brewfile
- Applies macOS defaults (Finder, Dock, keyboard)
- Links dotfiles into your home directory
- Sets up SSH key + GitHub SSH config (if `gh` is authenticated)
- Links an iTerm2 dynamic profile
- Applies Rectangle tweaks (gaps + launch on login)
- Optionally installs VS Code extensions (if `code` CLI is available)

## First-time personalization

Update these files with your details:

- `dotfiles/.zshrc` (aliases, prompt, etc)
- `Brewfile*` (packages and apps you want)

## Manual steps

Some settings still require manual actions:

- Sign in to App Store, iCloud, and 1Password (if used)
- Enable VS Code `code` command in PATH (VS Code: Command Palette > Shell Command)
- Grant accessibility permissions for apps like Rectangle

## Notes

Re-running the scripts is safe; they are designed to be idempotent.
