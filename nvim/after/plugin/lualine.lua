if not vim.g.term then
  do return end
end
require('lualine').setup {
  options = {
    icons_enabled = true,
    globalstatus = true,
    theme = 'dracula',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
