require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})

require("copilot_cmp").setup()

require("CopilotChat").setup({
	-- See Configuration section for options
	model = "claude-3.5-sonnet",
	window = {
		width = 0.4,
	},
})

-- show prompts with telescope
vim.keymap.set("n", "<leader>cp", function()
	local actions = require("CopilotChat.actions")
	require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end)

vim.keymap.set("n", "<leader>cq", function()
	local input = vim.fn.input("Chat > ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
	end
end)
