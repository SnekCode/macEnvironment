-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', ';', ':')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- source
vim.keymap.set('n', '<leader>so', ':luafile ~/.config/nvim/init.lua<CR>')

-- quick buffer close 
vim.keymap.set('n', '<leader>bd', ':bd<CR>')

-- next/prev buffer (tabs)
vim.keymap.set('n', '<leader><Tab>', ":bnext<CR>")
vim.keymap.set('n', '<leader><S-Tab>', ":bprev<CR>")

-- next/prev list tiem
vim.keymap.set('n', '<leader>]', ':cnext<CR>')
vim.keymap.set('n', '<leader>[', ':cprev<CR>')

-- write and quit maps
vim.keymap.set('n', '<leader>q', function() vim.cmd([[
    bd
    bn
    ]]) end)
vim.keymap.set('n', '<leader>Q', ':bd!|bn<CR>')
vim.keymap.set('n', '<leader>QQ', ':qa!<CR>')
vim.keymap.set('n', '<leader>w', ':wa<CR>')
vim.keymap.set('n', '<leader>W', ':wq<CR>')

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

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- delete marks
vim.keymap.set("n", "dm", "<cmd>delmarks A-Z0-9<CR>", {silent = true})

-- Window Buffer Management

vim.keymap.set("n", "<leader>swh", "<cmd>topleft vnew<CR>")
vim.keymap.set("n", "<leader>swl", "<cmd>botright vnew<CR>")
vim.keymap.set("n", "<leader>swk", "<cmd>topleft new<CR>")
vim.keymap.set("n", "<leader>swj", "<cmd>botright new<CR>")

vim.keymap.set("n", "<leader>sh", "<cmd>leftabove vnew<CR>")
vim.keymap.set("n", "<leader>sl", "<cmd>rightbelow vnew<CR>")
vim.keymap.set("n", "<leader>sk", "<cmd>leftabove new<CR>")
vim.keymap.set("n", "<leader>sj", "<cmd>rightbelow new<CR>")


vim.keymap.set("n", "<leader>b>", "<cmd>ls<CR><cmd>b")
