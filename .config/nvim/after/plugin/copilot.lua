require("CopilotChat").setup({
	-- See Configuration section for options
	model = "claude-3.5-sonnet",
})

-- show prompts with telescopt
vim.keymap.set("n", "<leader>ccp", function()
	local actions = require("CopilotChat.actions")
	require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end)

vim.keymap.set("n", "<leader>ccq", function()
	local input = vim.fn.input("Chat > ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
	end
end)
