local vscode = require("vscode")

-- Function to simplify mapping keys to VSCode actions
local function map_vscode_action(mode, key, action, opts)
    opts = opts or {}
    vim.keymap.set(mode, key, [[<cmd>lua require('vscode').action(']] .. action .. [[') <cr>]], opts)
end

-- VSCode actions mappings
map_vscode_action("n", "<leader>ff", "workbench.action.findInFiles")
map_vscode_action("n", "<leader>fc", "workbench.action.showCommands") -- find commands
map_vscode_action("n", "<leader>fp", "workbench.action.quickOpen") -- find files
map_vscode_action("n", "<leader>tw", "workbench.action.terminal.toggleTerminal") -- terminal window

-- FindItFaster mappings
map_vscode_action("n", "<leader>pf", "find-it-faster.findFiles")
map_vscode_action("n", "<leader>ps", "find-it-faster.findWithinFiles")



-- Uncomment and modify these as needed:
-- map_vscode_action("n", "<leader>xr", "references-view.findReferences") -- language references
-- map_vscode_action("n", "<leader>xd", "workbench.actions.view.problems") -- language diagnostics
-- map_vscode_action("n", "gr", "editor.action.goToReferences")
-- map_vscode_action("n", "<leader>rn", "editor.action.rename")
-- map_vscode_action("n", "<leader>fm", "editor.action.formatDocument")
-- map_vscode_action("n", "<leader>ca", "editor.action.refactor") -- language code actions
-- map_vscode_action("n", "<leader>ts", "workbench.action.toggleSidebarVisibility")
-- map_vscode_action("n", "<leader>th", "workbench.action.toggleAuxiliaryBar") -- toggle docview
-- map_vscode_action("n", "<leader>tp", "workbench.action.togglePanel")

-- Visual mode mappings
-- map_vscode_action("v", "<leader>fm", "editor.action.formatSelection")
-- map_vscode_action("v", "<leader>ca", "editor.action.refactor")
-- map_vscode_action("v", "<leader>fc", "workbench.action.showCommands")

-- You can now easily add more mappings using the map_vscode_action function

