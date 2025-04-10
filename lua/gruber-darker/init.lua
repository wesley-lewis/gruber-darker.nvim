local M = {}

M.config = {
	transparent = false,
	bold = true,
	underline = true,
}

-- @param config GruberDarkerConfig?
M.setup = function(config)
	M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

-- main load function
M.load = function()
	if vim.g.colors_name then
		vim.cmd.hi("clear")
	end
	vim.g.colors_name = "gruber-darker"
	vim.o.termguicolors = true
	vim.o.background = 'dark'

	local groups = require("gruber-darker.groups").setup()
	for group, settings in pairs(groups) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

return M
