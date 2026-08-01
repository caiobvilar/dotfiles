# Fonts

Vendored font packages used across this dotfiles setup (terminal, waybar icons, etc.), kept
in-repo so a fresh install doesn't depend on GitHub/Nerd Fonts/upstream maintainers still hosting
the same release.

## Install

```
./install.sh
```

Copies every `.ttf`/`.otf` under this directory into `~/.local/share/fonts/dotfiles` (or
`$XDG_DATA_HOME/fonts/dotfiles`) and refreshes the fontconfig cache. Safe to re-run.

## Packages

| Directory | Contents | Upstream |
|---|---|---|
| `NerdFonts-JetBrainsMono/` | JetBrainsMono + JetBrainsMonoNL, all weights, in Nerd Font / Nerd Font Mono / Nerd Font Propo flavors | [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts/releases/latest/), [JetBrains/JetBrainsMono](https://github.com/JetBrains/JetBrainsMono) |
| `NerdFonts-0xProto/` | 0xProto, Nerd Font / Mono / Propo, Regular/Bold/Italic | [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts/releases/latest/) |
| `NerdFonts-SymbolsOnly/` | Symbols-only Nerd Font (icon glyphs, used as a fallback alongside non-patched fonts) | [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts/releases/latest/) |
| `0xProto.zip` | Raw upstream release archive for 0xProto (kept alongside the extracted copy above) | same as `NerdFonts-0xProto/` |

Each font package directory carries its own `LICENSE`/`OFL.txt` from upstream — all are SIL Open
Font License.
