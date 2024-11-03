-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set(
  "i",
  "<F1>",
  "copilot#Accept('<CR>')",
  { noremap = true, silent = true, expr = true, replace_keycodes = false }
)
