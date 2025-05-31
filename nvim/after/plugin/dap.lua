if not vim.g.term then
  do return end
end
local dap, dapui, dap_python = require("dap"), require("dapui"), require('dap-python')
dap_python.setup('$CONDA_PREFIX/bin/python3')
-- table.insert(dap.configurations.python, {
--   type = 'python',
--   request = 'launch',
--   name = 'My custom launch configuration',
--   program = '${file}',
--   -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
-- })

dap_python.test_runner = "pytest"

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
 --  dapui.console()
  dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

vim.keymap.set('n', '<leader><F4>', function() require('dapui').close() end)
vim.keymap.set('n', '<F4>', function() require("dap").terminate() end)
vim.keymap.set('n', '<F5>', function() require("dap").continue() end)
vim.keymap.set('n', '<F6>', function() require("dap").step_over() end)
vim.keymap.set('n', '<leader>b', function() require("dap").toggle_breakpoint() end)


-- nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
-- nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
-- vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

vim.cmd [[command! PythonTestClass :lua require('dap-python').test_class()<CR>]]



