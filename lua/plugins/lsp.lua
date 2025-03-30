return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('lspconfig').csharp_ls.setup({ capabilities = capabilities })
      require('lspconfig').ts_ls.setup({ cmd = { 'typescript-language-server', '--stdio' } })
    end
  }
}
