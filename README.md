nix-darwin + home-manager config for a Mac. Managed via flake at `.config/nix`.

## Bootstrap on a fresh Mac

**1. Command Line Tools + Nix (one block, non-interactive)**

CLT is required before anything else: it provides `git` (to clone this repo)
and Homebrew's installer hard-refuses to run without it (nix-homebrew
installs Homebrew for you during step 3, so CLT has to exist first — it
can't be folded into the nix-darwin activation since darwin-rebuild doesn't
exist yet at this point). The snippet below installs CLT silently instead
of popping the GUI installer, then installs Nix:

```sh
# Command Line Tools (silent — avoids the GUI popup / manual "Install" click)
if ! xcode-select -p >/dev/null 2>&1; then
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
  PROD=$(softwareupdate -l | grep "\*.*Command Line Tools" | tail -n1 | sed 's/^[^C]* //')
  sudo softwareupdate -i "$PROD" --agree-to-license
  rm -f /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
fi

# Nix (Determinate Systems installer — flakes enabled by default)
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Restart the terminal after this so `nix` is on `PATH`.

**2. Sign into the App Store**

`apps.nix` installs Xcode via `masApps` (Mac App Store). `mas` needs an
already-signed-in App Store account or that install silently fails.

**3. Clone + stow**

```sh
git clone git@github.com:jeremyharland/dotfiles.git ~/dotfiles
cd ~/dotfiles
nix run nixpkgs#stow -- .
```

(`stow` itself is in `packages.nix`, so it isn't installed system-wide until
step 4 — `nix run` grabs it ad hoc for this one command. After step 4 you
can just run `stow` directly.)

This symlinks `.config/nvim`, `.config/tmux`, `.config/ghostty`, `.config/nix`,
`.ssh/config`, and `superwhisper/` into `$HOME`.

**3a. Create `~/.ssh/config.local`**

The tracked `.ssh/config` is generic on purpose — this repo is public.
Anything machine-specific (public IPs, personal/student IDs) goes in
`~/.ssh/config.local`, which stays outside the repo and is never committed:

```sh
cat > ~/.ssh/config.local <<'EOF'
Host myserver
  HostName 203.0.113.5
  User someone
EOF
chmod 600 ~/.ssh/config.local
```

**3b. Determinate installs: disable nix-darwin's Nix management**

The Determinate installer (step 1) runs its own daemon and manages
`nix.conf` itself. nix-darwin tries to manage Nix too by default and
hard-aborts activation when it detects Determinate ("Determinate detected,
aborting activation"). Add this to the `configuration` block in
`flake.nix` before the first switch:

```nix
nix.enable = false;
```

(Not committed as the default — machines with a non-Determinate Nix
install, e.g. the original `nix.settings.experimental-features` line
still in this repo, rely on nix-darwin managing `nix.conf` and would lose
flakes support if this were set globally. It's a per-machine toggle, same
as `username` below.)

**4. First activation**

`darwin-rebuild` doesn't exist yet on a fresh machine, so the first switch
runs through `nix run`:

```sh
sudo nix run nix-darwin -- switch --flake ~/.config/nix#mbp
```

This installs Homebrew itself, all casks/MAS apps, home-manager's zsh +
starship + plugin setup, and macOS defaults. Takes a while the first time.

**5. Subsequent changes**

```sh
darwin-rebuild switch --flake ~/.config/nix#mbp
```

## Gotchas

- **Username lives in one place.** `flake.nix` sets `username = "jeremy"` —
  that's the only line to change for a different account (e.g.
  `username = "jeremyharland"`). Everything else (`home.nix`, `apps.nix`)
  derives the home directory from `config.system.primaryUser` /
  `config.home.homeDirectory` instead of hardcoding `/Users/jeremy`.
- **Homebrew cleanup is aggressive.** `homebrew.onActivation.cleanup = "zap"`
  in `homebrew.nix` removes any cask/formula *not* listed in that file on
  every switch, including app data. Harmless on a blank Mac; be aware before
  running on a machine with unrelated Homebrew state.
- **Superwhisper config** (modes, vocab/replacements) lives in `superwhisper/`
  at the repo root and gets stowed to `~/superwhisper`. Recordings and models
  stay untracked/regenerated, so nothing large gets pulled by git.
