return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require('lspconfig').csharp_ls.setup({ capabilities = capabilities })
      require('lspconfig').ts_ls.setup({
	cmd = { 'typescript-language-server', '--stdio' },
	capabilities = capabilities
      })

      -- Setup format-on-write and some keymaps on LSP Attach
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

	  vim.api.nvim_create_autocmd('BufWritePre', {
	    buffer = args.buf,
	    callback = function()
	      vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
	    end,
	  })

	  vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = 0 })
	  vim.keymap.set("n", "grr", vim.lsp.buf.references, { buffer = 0 })
	  vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { buffer = 0 })
	  vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = 0 })
	  vim.keymap.set("n", "gri", vim.lsp.buf.implementation, { buffer = 0 })
	  vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<Return>", { buffer = 0 })
        end,
      })
    end
  }
}
