vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

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
vim.opt.shell = "zsh"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })

--ColorSchema
vim.opt.termguicolors = true

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- bind
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<A-j>", "<Cmd>m .+1<cr>==", opts)
vim.keymap.set("n", "<A-k>", "<Cmd>m .-2<cr>==", opts)
vim.keymap.set("i", "<A-j> <Esc>", "<Cmd>m .+1<cr>==gi", opts)
vim.keymap.set("i", "<A-k> <Esc>", "<Cmd>m .-2<cr>==gi", opts)

local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- GROUPS:
local disable_node_modules_eslint_group = autogroup("DisableNodeModulesEslint", { clear = true })
local my_config_group = autogroup("MyConfigGroup", { clear = true })

-- -- AUTO-COMMANDS:
-- autocmd({ "BufNewFile", "BufRead" }, {
-- 	pattern = { "**/node_modules/**", "node_modules", "/node_modules/*", "**/dist/**", "dist", "/dist/*" },
-- 	callback = function()
-- 		vim.diagnostic.disable()
-- 	end,
-- 	group = disable_node_modules_eslint_group,
-- })

-- session
autocmd({ "User" }, {
	pattern = "SessionLoadPost",
	group = my_config_group,
	callback = function()
		require("nvim-true").toggle(false, true)
	end,
})

autocmd({ "BufWritePost" }, {
	pattern = "*.*",
	group = my_config_group,
	callback = function()
		if vim.bo.filetype ~= "git" and not vim.bo.filetype ~= "gitcommit" then
			require("session_manager").autosave_session()
		end
	end,
})

local save_fold = autogroup("Persitent Folds", { clear = true })
autocmd("BufWinLeave", {
	pattern = "*.*",
	callback = function()
		vim.cmd.mkview()
	end,
	group = save_fold,
})

autocmd("BufWinEnter", {
	pattern = "*.*",
	callback = function()
		vim.cmd.loadview({ mods = { emsg_silent = true } })
	end,
	group = save_fold,
})

-- Persistent Cursor
autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Cursor Line on each window
autocmd({ "InsertLeave", "WinEnter" }, {
	callback = function()
		local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
		if ok and cl then
			vim.wo.cursorline = true
			vim.api.nvim_win_del_var(0, "auto-cursorline")
		end
	end,
})
autocmd({ "InsertEnter", "WinLeave" }, {
	callback = function()
		local cl = vim.wo.cursorline
		if cl then
			vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
			vim.wo.cursorline = false
		end
	end,
})
