return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('lspconfig').csharp_ls.setup({ capabilities = capabilities })
      require('lspconfig').ts_ls.setup({ cmd = { 'typescript-language-server', '--stdio' } })

      vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
	  local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

	  -- Setup native auto cmp
	  if client:supports_method('textDocument/completion') then
	    vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
	  end

	  -- Setup format-on-save
	  if not client:supports_method('textDocument/willSaveWaitUntil')
	    and client:supports_method('textDocument/formatting') then
	    vim.api.nvim_create_autocmd('BufWritePre', {
	      group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
	      buffer = args.buf,
	      callback = function()
		vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
	      end,
	    })
	  end

	  -- Modify how the autocompletion works
	  vim.opt.cot = "fuzzy,menu,popup,noinsert"

	  -- Enable diagnostic text
	  vim.diagnostic.config({ virtual_text = true })
	end
      })
    end
  }
}
