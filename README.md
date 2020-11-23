# Basic setup instructions

- Go into `pythonx` directory and run:

```bash
$ python3 -m pip install --user -r requirements.txt
```

This will ensure that the inflection libraries used for Elixir snippets can work with neovim. If this still fails, install `pynvim` which is the Python bindings library.

- Clone `elixir_ls` into the `$HOME` directory like so:

```bash
$ git clone https://github.com/elixir-lsp/elixir-ls.git ~/.elixir-ls
$ cd ~/.elixir-ls
$ mix deps.get && mix compile && mix elixir_ls.release -o release
```

This will build elixir with the current version of Elixir running in the shell.
