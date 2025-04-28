return {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  ---@type solarized.config
  opts = {
    variant = "spring",
  },
  config = function(_, opts)
	  vim.o.termguicolors = false
    	  vim.o.background = 'light'
    	  require('solarized').setup(opts)
    	  vim.cmd.colorscheme 'solarized'
  end,
}
