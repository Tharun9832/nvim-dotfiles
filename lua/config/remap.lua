vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ft", vim.cmd.Ex)

-- Move selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Configure tab width
vim.opt.shiftwidth = 4

-- Configure line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Use OS clipboard buffer
vim.opt.clipboard = "unnamedplus"

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

