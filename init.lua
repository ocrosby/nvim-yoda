-- init.lua
-- yoda-starter — clone this into ~/.config/nvim.
--
-- Keep this file short. It exists to set the leader keys (which must be set
-- before any keymap is defined, including yoda's) and hand off to lazy.nvim.
--
-- Your configuration goes in:
--   lua/plugins/yoda.lua      -- yoda's own options, and which extras you want
--   lua/plugins/overrides.lua -- your personal plugins and yoda overrides

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
