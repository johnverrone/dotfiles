-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- delete defaults
vim.keymap.del("n", "<leader>gB")
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")

-- paste in visual and keep pasted value in register
vim.keymap.set("x", "<leader>p", '"_dP')

-- faster saving
vim.keymap.set("n", "zz", vim.cmd.update)

-- yank to clipboard with leader-y/Y
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- cycle through cmdline completion with up/down arrows
vim.keymap.set("c", "<Up>", "<S-Tab>", { silent = true })
vim.keymap.set("c", "<Down>", "<Tab>", { silent = true })

-- quick jump to start / end of linie
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- copy current file path (relative to project root) with line number/range to clipboard
vim.api.nvim_create_user_command("CopyFilePath", function(opts)
  local file_path = vim.fn.expand("%:p")

  -- make the path relative to the project root, falling back to the absolute path
  local root = vim.fs.root(0, ".git")
  local path = file_path
  if root then
    path = file_path:gsub("^" .. vim.pesc(root) .. "/", "")
  end

  -- opts.range > 0 when invoked from a visual selection (:'<,'> auto-inserted)
  local line1, line2
  if opts.range > 0 then
    line1, line2 = opts.line1, opts.line2
  else
    line1 = vim.fn.line(".")
    line2 = line1
  end
  local line_spec = line1 == line2 and tostring(line1) or (line1 .. "-" .. line2)

  local result = path .. ":" .. line_spec
  vim.fn.setreg("+", result)
  vim.notify("Copied to clipboard: " .. result)
end, { range = true, desc = "Copy current file path with line number/range" })

vim.keymap.set({ "n", "x" }, "<leader>cy", ":CopyFilePath<CR>", {
  silent = true,
  desc = "Copy current file path with line number/range",
})
