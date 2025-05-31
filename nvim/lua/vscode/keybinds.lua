print('vscode keybinds')
-- nmap <Leader>n <cmd>call VSCodeNotify('-workbench.action.toggleAuxiliaryBar')<cr>
--
   vim.api.nvim_set_keymap(
  "n",
  "<leader>n",
  "<Cmd>call VSCodeNotify('workbench.action.toggleAuxiliaryBar')<CR>",
  { noremap = true }
  )

  vim.api.nvim_set_keymap(
  "n",
  "<leader>w",
  "<Cmd>call VSCodeNotify('workbench.action.files.saveFiles')<CR>",
  { noremap = true }
  )

  vim.api.nvim_set_keymap(
  "n",
  "<leader>q",
  "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>",
  { noremap = true }
  )

  vim.api.nvim_set_keymap(
  "n",
  "<leader>.",
  "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>",
  { noremap = true }
  )

  vim.api.nvim_set_keymap(
  "n",
  "<leader>,",
  "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>",
  { noremap = true }
  )
--
-- line moves
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

-- half page jumping cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search keep cursor in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever pastes but dumps in to void
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>dd", [["_dd]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- delete marks
vim.keymap.set("n", "dm", "<cmd>delmarks A-Z0-9<CR>", {silent = true})
