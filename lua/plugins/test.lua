return {
  { "nvim-neotest/nvim-nio" },
  { "nvim-neotest/neotest-plenary" },
  { "jfpedroza/neotest-elixir" },
  {
    "nvim-neotest/neotest",
    commit = "52fca67",
    opts = {
      adapters = {
        ["neotest-elixir"] = {
          post_process_command = function(cmd)
            return vim
              .iter({
                {
                  "docker-compose",
                  "-f",
                  "/Users/nathan/code/super_api/docker-compose.yml",
                  "-f",
                  "/Users/nathan/code/super_api/docker-compose.base.yml",
                  "-f",
                  "/Users/nathan/code/docker-compose.shared.yml",
                  "exec",
                  "super-api",
                  "./entrypoint.sh",
                },
                cmd,
              })
              :flatten()
              :totable()
          end,
        },
        -- ["neotest-plenary"] = {},
      },
    },
  },
}
