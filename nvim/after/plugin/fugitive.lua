if not vim.g.term then
  do return end
end
vim.keymap.set("n", '<leader>gs', "<cmd>vertical belowright Git<CR>", {silent=true})

