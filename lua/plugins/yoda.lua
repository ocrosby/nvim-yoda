-- lua/plugins/yoda.lua
-- yoda.nvim itself, plus the language extras you want.
--
-- This is the file to edit for distribution-level configuration. Personal
-- plugins and per-plugin overrides belong in overrides.lua.

return {
  {
    "jedi-knights/yoda.nvim",

    -- Follow released majors. `version = "*"` resolves to the newest v1.x
    -- tag, so you get fixes and features but never an unannounced breaking
    -- change -- a v2.0.0 would not be picked up until you widen this.
    version = "*",

    -- Pulls in yoda's core plugin specs. Without this you get the yoda Lua
    -- modules but none of the plugins the distribution is built from.
    import = "yoda.plugins",

    -- Loaded eagerly and early: setup() installs options, keymaps and
    -- autocmds that the rest of the session assumes are already in place.
    lazy = false,
    priority = 10000,

    -- Everything here is optional — the defaults in yoda's config.lua apply
    -- for anything you leave out. See `:help yoda-configuration`.
    opts = {
      ui = {
        show_environment_notification = true,
      },

      -- Escape hatches. Set any of these false to keep yoda's plugins but
      -- supply your own options / keymaps / autocmds.
      defaults = {
        options = true,
        keymaps = true,
        autocmds = true,
      },
    },

    -- Options must be applied before lazy sources the plugins they affect,
    -- which is earlier than `config` runs. apply() is idempotent, so setup()
    -- re-applying below is a no-op.
    init = function()
      require("yoda.options").apply()
    end,

    config = function(_, opts)
      require("yoda").setup(opts)
    end,
  },

  -- ── Language extras ────────────────────────────────────────────────────
  -- Opt in to the stacks you use and delete the rest. Each pulls in that
  -- language's neotest adapter, DAP adapter and tooling. Nothing here is
  -- required; yoda's core works with none of them enabled.
  { import = "yoda.extras.lang.lua" },
  { import = "yoda.extras.lang.go" },
  { import = "yoda.extras.lang.node" },
  { import = "yoda.extras.lang.python" },
  { import = "yoda.extras.lang.rust" },
}
