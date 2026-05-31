return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        ["expert"] = {
          cmd = { "expert", "--stdio" },
          root_markers = { "mix.exs", ".git" },
          filetypes = { "elixir", "eelixir", "heex" },
        },
        ["tailwindcss"] = {
          filetypes_include = { "html", "heex", "eelixir" },
        },
      },
      setup = {},
    },
  },
}
