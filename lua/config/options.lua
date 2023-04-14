local opt = vim.opt
local g = vim.g

opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 5
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldnestmax = 0
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
  cache_enabled = 0,
}

vim.cmd([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END
]])
