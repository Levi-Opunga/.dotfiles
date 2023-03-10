function rosePine(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
        vim.api.nvim_set_hl(0,"Normal",	{bg = "none"})
	vim.api.nvim_set_hl(0,"NormalFloat",	{bg = "none"})
end


function clearBg()
        vim.api.nvim_set_hl(0,"Normal",	{bg = "none"})
	vim.api.nvim_set_hl(0,"NormalFloat",	{bg = "none"})

end

function lightBg()
vim.o.background = "light" -- or "light" for light mode
end

function darkBg()
vim.o.background = "dark" -- or "light" for light mode
end

