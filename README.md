# nvim-yoda

My personal Neovim configuration.

Built on [yoda.nvim](https://github.com/jedi-knights/yoda.nvim) — an AI-first
Neovim distribution — from the
[yoda-starter](https://github.com/jedi-knights/yoda-starter) template. The
distribution is a plugin declared in `lua/plugins/yoda.lua`; everything in this
repository is mine to change.

## Install

```bash
git clone https://github.com/ocrosby/nvim-yoda ~/.config/nvim
nvim
```

First launch bootstraps lazy.nvim and installs everything.

To try it without disturbing an existing setup:

```bash
git clone https://github.com/ocrosby/nvim-yoda ~/.config/yoda-trial
NVIM_APPNAME=yoda-trial nvim
```

Delete `~/.config/yoda-trial` and `~/.local/share/yoda-trial` to undo it.

## Layout

```text
init.lua                   # Leader keys, then hands off to lazy
lua/config/lazy.lua        # lazy.nvim bootstrap and options
lua/plugins/yoda.lua       # yoda.nvim + which language extras are on
lua/plugins/overrides.lua  # My own plugins and overrides
lazy-lock.json             # Pinned plugin revisions — committed on purpose
```

Two files carry all the configuration: `yoda.lua` for the distribution's
options and language extras, `overrides.lua` for anything personal.

## Notes to myself

- **All five language extras are enabled** (`lua`, `go`, `node`, `python`,
  `rust`). Trim the ones I stop using — each costs startup time.
- **`lazy-lock.json` is committed deliberately.** It is the rollback mechanism:
  restore an older copy and run `:Lazy restore` to undo a bad update.
- **`yoda.nvim` is pinned to `version = "*"`** — the newest v1.x release. A
  future v2.0.0 will not be picked up until I widen that constraint on purpose.
- **`lua/local.lua` is gitignored** for machine-specific settings that should
  not follow me across machines.
- Run `:checkhealth yoda` when something looks wrong.

## License

MIT
