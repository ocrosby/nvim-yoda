-- lua/plugins/overrides.lua
-- Your own plugins, and overrides of yoda's.
--
-- lazy.nvim merges any spec here with the one yoda declares for the same
-- plugin, so you can change a single option without copying yoda's whole
-- spec. Note that `config` is REPLACED rather than merged — if yoda's spec
-- uses `config` and you supply your own, yours wins entirely.
--
-- Examples:
--
--   return {
--     -- Override one option on a plugin yoda already ships
--     { "folke/tokyonight.nvim", opts = { style = "moon" } },
--
--     -- Add a plugin of your own
--     { "tpope/vim-fugitive", cmd = "Git" },
--
--     -- Disable something yoda ships
--     { "nvzone/showkeys", enabled = false },
--   }

return {
  -- asmview.nvim — compile the function at the cursor to assembly in a
  -- right-side vsplit, with the asm lines for the current source line
  -- highlighted as you navigate. Supports C, C++, Rust, and Go via each
  -- toolchain's native `-S` / `--emit=asm` / `go build -gcflags=-S` path.
  --
  -- `version = "*"` tracks the latest semver tag so :Lazy sync picks up
  -- published releases without pulling every unreleased commit on main.
  -- Lazy-loaded on the four supported filetypes and on `:Asm` — users on
  -- an unsupported filetype who want to peek can still invoke the command.
  --
  -- No <leader> key is claimed here — yoda's AI group owns `<leader>a`
  -- (lua/yoda/plugins/ai.lua) and I'd rather bind `<Plug>(AsmView)` to
  -- something project-specific when I need it than lock in a global
  -- shortcut for a niche tool.
  {
    "jedi-knights/asmview.nvim",
    version = "*",
    ft = { "c", "cpp", "cxx", "objcpp", "rust", "go" },
    cmd = "Asm",
    opts = {},
  },
}
