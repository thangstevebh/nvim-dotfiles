local opt = vim.opt
local g = vim.g

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

vim.wo.number = true

opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.shell = "zsh"
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.inccommand = "split"
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false -- No Wrap lines
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })

opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 5
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldnestmax = 0

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })

g.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize,terminal"
g.clipboard = {
	name = "xsel",
	copy = {
		["+"] = "xsel -i -b",
		["*"] = "xsel -i -p",
	},
	paste = {
		["+"] = "xsel -o -b",
		["*"] = "xsel -o -p",
	},
	cache_enable = 0,
}
