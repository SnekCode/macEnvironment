if not vim.g.term then
  do return end
end
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

 require("nvim-tree").setup({
   view = {
     adaptive_size = true,
   }
 })

vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')

--   mappings = {
--     list = {
--       {key = "-", action = "dir_up"},
--       {key = "", action = "cd"}
--     }
--   }
