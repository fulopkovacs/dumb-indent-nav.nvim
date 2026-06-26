vim.opt.rtp:prepend(".deps/docgen.nvim")
vim.opt.rtp:prepend(".")

vim.fn.mkdir("doc", "p")

require("docgen").run({
	name = "dumb-indent-nav",
	description = "Navigate between lines with the same indentation.",
	files = {
		{
			"./lua/dumb-indent-nav/init.lua",
			title = "API",
			tag = "dumb-indent-nav",
			fn_prefix = "dumb-indent-nav",
			fn_tag_prefix = "dumb-indent-nav",
		},
	},
})
