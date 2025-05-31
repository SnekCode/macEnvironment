if not vim.g.term then
  do return end
end
require('telescope').setup()
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.git_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.find_files, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
