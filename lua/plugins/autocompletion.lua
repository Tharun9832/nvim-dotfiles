return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',

    opts = {
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      keymap = { preset = 'default' },

      appearance = {
	nerd_font_variant = 'mono'
      },

      completion = {
	documentation = { auto_show = true, auto_show_delay_ms = 500 },
	list = {
	  selection = { preselect = true, auto_insert = false }
	}
      },

      sources = {
	default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      signature = { enabled = true },

      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
