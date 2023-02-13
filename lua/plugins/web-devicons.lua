return {
	"kyazdani42/nvim-web-devicons",
	config = function()
		require('indent_blankline').setup{
			override = {
			zsh = {
				icon = "",
				color = "#428850",
				cterm_color = "65",
				name = "Zsh"
			}
		},
		color_icons = true,
		default = true,
		strict = true,
		override_by_filename = {
			[".gitignore"] = {
				icon = "",
				color = "#f1502f",
				name = "Gitignore"
			}
		 }
	}
	end
}
