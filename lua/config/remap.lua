vim.g.mapleader = " "

-- Open netrw
vim.keymap.set("n", "<leader>ft", vim.cmd.Ex)

-- Move selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Tab management
vim.keymap.set("n", "te", ":tabedit<Return>")
vim.keymap.set("n", "<tab>", ":tabnext<Return>")
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>")

-- Split windows
vim.keymap.set("n", "ws", ":split<Return>")
vim.keymap.set("n", "wv", ":vsplit<Return>")

-- Move between windows
vim.keymap.set("n", "wh", "<C-w>h")
vim.keymap.set("n", "wj", "<C-w>j")
vim.keymap.set("n", "wk", "<C-w>k")
vim.keymap.set("n", "wl", "<C-w>l")

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

