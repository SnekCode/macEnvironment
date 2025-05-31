if not vim.g.term then
  do return end
end
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_WindowLayout = 3
