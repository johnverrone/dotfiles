-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = ""

-- Scope the Rust toolchain (rustup) to where nvim was launched:
--   * inside the fsdev tree -> fsdev rustup (same as the repo's direnv .envrc)
--   * anywhere else         -> the default ~/.rustup, even when a stale fsdev
--                              env was inherited from the launching shell.
-- A rustup proxy resolves its toolchain from RUSTUP_HOME/CARGO_HOME at runtime,
-- so setting these is enough to flip rust-analyzer regardless of $PATH.
do
  local fsdev_home = vim.fn.expand("~/src/fsdev")
  local cwd = vim.fn.getcwd()
  local in_fsdev = cwd == fsdev_home or vim.startswith(cwd, fsdev_home .. "/")
  if in_fsdev then
    vim.env.RUSTUP_HOME = fsdev_home .. "/tools/rustup"
    vim.env.CARGO_HOME = fsdev_home .. "/tools/cargo"
  else
    vim.env.RUSTUP_HOME = vim.fn.expand("~/.rustup")
    vim.env.CARGO_HOME = vim.fn.expand("~/.cargo")
  end
end
