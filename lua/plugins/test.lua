return {
  { "nvim-neotest/nvim-nio" },
  { "nvim-neotest/neotest-plenary" },
  { "jfpedroza/neotest-elixir" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-elixir"] = {},
      },
    },
  },
}
