return {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({
			disable_filetype = { "TelescopePrompt", "vim" },
			check_ts = true,
			ts_config = {
				lua = { "string" }, -- it will not add a pair on that treesitter node
				javascript = { "template_string" },
				java = false, -- don't check treesitter on java
			},
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = "$",
				before_key = "h",
				after_key = "l",
				cursor_pos_before = true,
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				manual_position = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})

		local Rule = require("nvim-autopairs.rule")
		local npairs = require("nvim-autopairs")

		-- npairs.add_rule(Rule("$$", "$$", "tex"))

		-- you can use some built-in conditions

		local cond = require("nvim-autopairs.conds")
		-- print(vim.inspect(cond))

		npairs.add_rules(
			{
				Rule("$", "$", { "tex", "latex" })
					-- don't add a pair if the next character is %
					:with_pair(cond.not_after_regex("%%"))
					-- don't add a pair if  the previous character is xxx
					:with_pair(
						cond.not_before_regex("xxx", 3)
					)
					-- don't move right when repeat character
					:with_move(cond.none())
					-- don't delete if the next character is xx
					:with_del(cond.not_after_regex("xx"))
					-- disable adding a newline when you press <cr>
					:with_cr(cond.none()),
			},
			-- disable for .vim files, but it work for another filetypes
			Rule("a", "a", "-vim")
		)

		npairs.add_rules({
			Rule("$$", "$$", "tex"):with_pair(function(opts)
				print(vim.inspect(opts))
				if opts.line == "aa $$" then
					-- don't add pair on that line
					return false
				end
			end),
		})

		-- you can use regex
		-- press u1234 => u1234number
		npairs.add_rules({
			Rule("u%d%d%d%d$", "number", "lua"):use_regex(true),
		})

		-- press x1234 => x12341234
		npairs.add_rules({
			Rule("x%d%d%d%d$", "number", "lua"):use_regex(true):replace_endpair(function(opts)
				-- print(vim.inspect(opts))
				return opts.prev_char:sub(#opts.prev_char - 3, #opts.prev_char)
			end),
		})

		-- you can do anything with regex +special key
		-- example press tab to uppercase text:
		-- press b1234s<tab> => B1234S1234S

		npairs.add_rules({
			Rule("b%d%d%d%d%w$", "", "vim"):use_regex(true, "<tab>"):replace_endpair(function(opts)
				return opts.prev_char:sub(#opts.prev_char - 4, #opts.prev_char) .. "<esc>viwU"
			end),
		})

		-- you can exclude filetypes
		-- npairs.add_rule(Rule("$$", "$$"):with_pair(cond.not_filetypes({ "lua" })))

		local ts_conds = require("nvim-autopairs.ts-conds")

		-- press % => %% only while inside a comment or string
		npairs.add_rules({
			Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
			Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		local handlers = require("nvim-autopairs.completion.handlers")

		cmp.event:on(
		  "confirm_done",
		  cmp_autopairs.on_confirm_done({
		    filetypes = {
		      -- "*" is a alias to all filetypes
		      ["*"] = {
		        ["("] = {
		          kind = {
		            cmp.lsp.CompletionItemKind.Function,
		            cmp.lsp.CompletionItemKind.Method,
		          },
		          handler = handlers["*"],
		        },
		      },
		      lua = {
		        ["("] = {
		          kind = {
		            cmp.lsp.CompletionItemKind.Function,
		            cmp.lsp.CompletionItemKind.Method,
		          },
		          ---@param char string
		          ---@param item table item completion
		          ---@param bufnr number buffer number
		          ---@param rules table
		          ---@param commit_character table<string>
		          handler = function(char, item, bufnr, rules, commit_character)
		            -- Your handler function. Inpect with print(vim.inspect{char, item, bufnr, rules, commit_character})
		          end,
		        },
		      },
		      -- Disable for tex
		      tex = false,
		    },
		  })
		)
	end,
}
