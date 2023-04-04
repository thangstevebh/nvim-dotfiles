local keymap = vim.keymap

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set("n", "te", ":tabedit<Return>", { silent = true })
-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })
-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

keymap.set("", "s<left>", "<C-w>h")
keymap.set("", "s<up>", "<C-w>k")
keymap.set("", "s<down>", "<C-w>j")
keymap.set("", "s<right>", "<C-w>l")
-- Switch direction
keymap.set("", "sH", "<cmd>wincmd H<CR>")
keymap.set("", "sL", "<cmd>wincmd L<CR>")
keymap.set("", "sJ", "<cmd>wincmd J<CR>")
keymap.set("", "sK", "<cmd>wincmd K<CR>")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Formatter Linter
keymap.set("n", "<leader>f", ":Prettier<Return>", { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<leader>ff",
	"<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
	{ noremap = true, silent = true }
)

-- Save Document
keymap.set("n", "<C-s>", ":wa<Return>", { noremap = true, silent = true })

--Lazygit
keymap.set("n", "<Leader>gg", ":LazyGit<Return>", { silent = true })

--transparent
keymap.set("n", "<Leader>tt", ":TransparentToggle<Return>", { silent = true , noremap = true })

--COPY PASTE CUT
--
keymap.set("i", "<C-X>", '"+x',{ silent = true })
keymap.set("v", "<C-X>", '"+x', { silent = true })

keymap.set("i", "<C-C>", '"+y', { silent = true })
keymap.set("v", "<C-c>", '"+y', { silent = true })

keymap.set("i", "<C-v>", '"+gP', { silent = true })
keymap.set("n", "<C-v>", '"+gP', { silent = true })

--REDO
keymap.set("n", "<C-z>", "<C-r>")
