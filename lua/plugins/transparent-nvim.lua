return {
	"xiyaowong/transparent.nvim",
	config = function()
		local transparent = require("transparent").setup({
			groups = { -- table: default groups
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLineNr",
				"EndOfBuffer",
				"NormalFloat",
				"Pmenu",
				"Float",
			},
			extra_groups = {
				"IndentBlanklineChar",

				-- make floating windows transparent
				"LspFloatWinNormal",
				"Normal",
				"NormalFloat",
				"FloatBorder",
				"TelescopeNormal",
				"TelescopeBorder",
				"TelescopePromptBorder",
				"SagaBorder",
				"SagaNormal",
			}, -- table: additional groups that should be cleared
			exclude_groups = {}, -- table: groups you don't want to clear
		})
	end,
}
