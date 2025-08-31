-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- Configure LazyVim to load gruvbox
  --
  { "rebelot/kanagawa.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
  { "nvim-neotest/nvim-nio" },
  { "jfpedroza/neotest-elixir" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-elixir"] = {
          post_process_command = function(cmd)
            return vim.iter({{"docker-compose", "-f", "/Users/nathan/code/super_api/docker-compose.yml", "-f", "/Users/nathan/code/super_api/docker-compose.base.yml", "-f", "/Users/nathan/code/docker-compose.shared.yml", "exec", "super-api", "./entrypoint.sh"}, cmd}):flatten():totable()
          end,
        }
      }
    },
  },
  {
    "tpope/vim-projectionist",
    config = function()
      vim.g.projectionist_heuristics = {
        ["*"] = {
          ["lib/*.ex"] = {
            alternate = "test/{}_test.exs",
            type = "source",
          },
          ["test/*_test.exs"] = {
            alternate = "lib/{}.ex",
            type = "test",
          },
        },
      }
    end,
    lazy = false,
  },

  { "Olical/conjure" },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  { "folke/trouble.nvim", enabled = true },

  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
        require'window-picker'.setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
      },
      setup = {
        expert = function (_, _)
          vim.lsp.config('expert', {
            cmd = { 'expert' },
            root_markers = { 'mix.exs', '.git' },
            filetypes = { 'elixir', 'eelixir', 'heex' },
          })

          vim.lsp.enable 'expert'
        end,
      },
    },
  },

  { "github/copilot.vim" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "elixir",
        "eex",
        "heex",
        "html",
      },
    },
  },
}
