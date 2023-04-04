vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

--ColorSchema
vim.opt.termguicolors = true

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- bind
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<A-j>', '<Cmd>m .+1<cr>==', opts)
vim.keymap.set('n', '<A-k>', '<Cmd>m .-2<cr>==', opts)
vim.keymap.set('i', '<A-j> <Esc>', '<Cmd>m .+1<cr>==gi', opts)
vim.keymap.set('i', '<A-k> <Esc>', '<Cmd>m .-2<cr>==gi', opts)

local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- GROUPS:
local disable_node_modules_eslint_group =
	ag("DisableNodeModulesEslint", { clear = true })

-- AUTO-COMMANDS:
au({ "BufNewFile", "BufRead" }, {
	pattern = { "**/node_modules/**", "node_modules", "/node_modules/*", "**/dist/**", "dist", "/dist/*" },
	callback = function()
		vim.diagnostic.disable()
	end,
	group = disable_node_modules_eslint_group,
})
