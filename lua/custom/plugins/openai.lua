return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<leader>gpt", "<cmd>ChatGPT<CR>", { desc = "Chat [GPT]" })

		vim.keymap.set("n", "<leader>gpt", "<cmd>ChatGPTEditWithInstruction<CR>", { desc = "Edit with instruction" })
		-- vim.keymap.set("n", "<leader>xxx", "<cmd>ChatGPTRun grammar_correction<CR>", { desc = "Grammar Correction" } )
		-- vim.keymap.set("n", "<leader>xxx", "<cmd>ChatGPTRun translate<CR>", { desc = "Translate" } )
		-- vim.keymap.set("n", "<leader>xxx", "<cmd>ChatGPTRun keywords<CR>", { desc = "Keywords" } )
		-- vim.keymap.set("n", "<leader>xxx", "<cmd>ChatGPTRun summarize<CR>", { desc = "Summarize" } )
		vim.keymap.set("n", "<leader>aid", "<cmd>ChatGPTRun docstring<CR>", { desc = "[AI] [D]ocstring" })
		vim.keymap.set("n", "<leader>ait", "<cmd>ChatGPTRun add_tests<CR>", { desc = "[AI] Add [T]ests" })
		vim.keymap.set("n", "<leader>aio", "<cmd>ChatGPTRun optimize_code<CR>", { desc = "[AI] [O]ptimize Code" })
		vim.keymap.set("n", "<leader>aif", "<cmd>ChatGPTRun fix_bugs<CR>", { desc = "[AI] [F]ix Bugs" })
		vim.keymap.set("n", "<leader>aie", "<cmd>ChatGPTRun explain_code<CR>", { desc = "[AI] [E]xplain Code" })
		-- vim.keymap.set("n", "<leader>xxx", "<cmd>ChatGPTRun roxygen_edit<CR>", { desc = "Roxygen Edit" } )
		vim.keymap.set("n", "<leader>aic", "<cmd>ChatGPTRun code_readability_analysis<CR>",
			{ desc = "[AI] [C]ode Readability Analysis" })

		require("chatgpt").setup({
			-- this config assumes you have OPENAI_API_KEY environment variable set
			openai_params = {
				-- NOTE: model can be a function returning the model name
				-- this is useful if you want to change the model on the fly
				-- using commands
				-- Example:
				-- model = function()
				--     if some_condition() then
				--         return "gpt-4-1106-preview"
				--     else
				--         return "gpt-3.5-turbo"
				--     end
				-- end,
				model = "gpt-4o-mini",
				frequency_penalty = 0,
				presence_penalty = 0,
				max_tokens = 4095,
				temperature = 0.2,
				top_p = 0.1,
				n = 1,
			}
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim", -- optional
		"nvim-telescope/telescope.nvim"
	}
}
