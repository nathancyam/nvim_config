return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {},
      setup = {
        expert = function(_, _)
          vim.lsp.config("expert", {
            cmd = { "expert", "--stdio" },
            root_markers = { "mix.exs", ".git" },
            filetypes = { "elixir", "eelixir", "heex" },
          })

          vim.lsp.enable("expert")
        end,
      },
    },
  },
}
