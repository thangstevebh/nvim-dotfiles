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
keymap.set("n", "tq", ":tabclose<Return>", { silent = true })
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
-- keymap.set("n", "<C-i>", ":Prettier<Return>", { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<C-i>",
	"<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
	{ noremap = true, silent = true }
)

-- Save Document
keymap.set("n", "<C-s>", ":wa<Return>", { noremap = true, silent = true })

-- Format

--Lazygit
keymap.set("n", "<Leader>gg", ":LazyGit<Return>", { silent = true })

--transparent
keymap.set("n", "<Leader>tt", ":TransparentToggle<Return>", { silent = true, noremap = true })

-- bind
local opts = { noremap = true, silent = true }
keymap.set("n", "<A-j>", "<Cmd>m .+1<cr>==", opts)
keymap.set("n", "<A-k>", "<Cmd>m .-2<cr>==", opts)
keymap.set("i", "<A-j> <Esc>", "<Cmd>m .+1<cr>==gi", opts)
keymap.set("i", "<A-k> <Esc>", "<Cmd>m .-2<cr>==gi", opts)
--COPY PASTE CUT
--
keymap.set("v", "<C-X>", '"+x', { silent = true })

keymap.set("v", "<C-c>", '"+y', { silent = true })

keymap.set("n", "<C-v>", '"+gP', { silent = true })
keymap.set("i", "<C-v>", '"+pa', { silent = true })

--REDO
keymap.set("n", "<C-z>", "<C-r>")

-- aerial
--
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- Toggle Diagnostic
keymap.set("n", "<leader>z", "<cmd>ToggleDiag<CR>")

-- Rest Api
keymap.set("n", "<Leader>cc", "<Plug>RestNvim", { silent = true, noremap = true })
keymap.set("n", "<Leader>cp", "<Plug>RestNvimPreview", { silent = true, noremap = true })
keymap.set("n", "<Leader>cl", "<Plug>RestNvimLast", { silent = true, noremap = true })
