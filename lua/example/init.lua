local M = {}

local curTheme = 1

local defaultColors = {

	"vim",
	"peachpuff",
	"desert",
	"evening",
	"torte",
}

function M.CycleTheme(colorschemes)
	vim.cmd(":colorscheme " .. colorschemes[curTheme])

	curTheme = curTheme % #colorschemes + 1
end

function M.ResetTheme(default)
	vim.cmd(":colorscheme " .. default)

	curTheme = 1
end

function M.Transparent_BG()
	vim.cmd("highlight Normal guibg=none ctermbg=none")
	vim.cmd("highlight NonText guibg=none ctermbg=none")
end

function M.setup(opts)
	opts = opts or {}

	local default = opts.default or "vim"

	local colorschemes = opts.colorschemes or defaultColors

	vim.api.nvim_create_user_command("CycleTheme", M.CycleTheme(colorschemes), {})

	vim.api.nvim_create_user_command("ResetTheme", M.ResetTheme(default), {})

	vim.api.nvim_create_user_command("TransparentBackground", M.Transparent_BG(), {})
end

return M
