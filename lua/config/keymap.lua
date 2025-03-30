-- Open netrw
vim.keymap.set("n", "<leader>ft", vim.cmd.Ex)

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Tab management
vim.keymap.set("n", "tn", ":tabnew<CR>")
vim.keymap.set("n", "<tab>", ":tabnext<CR>")
vim.keymap.set("n", "<s-tab>", ":tabprev<CR>")

-- Split windows
vim.keymap.set("n", "<leader>ws", ":split<CR>")
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>")

-- Move between windows
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

-- Configure tab width
vim.opt.shiftwidth = 4

-- Disable wordwrap
vim.opt.wrap = false

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

