vim.g.mapleader = ' '
vim.g.maplocalleader = ' '



if vim.g.vscode then
  -- require("vscode.plugins")
        require("vscode.keybinds")
else
        vim.g.term = true
        require("core.plugins")
        require("core.options")
        require("core.commands")
        require("core.keymaps")
end
