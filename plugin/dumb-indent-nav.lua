if vim.g.loaded_dumb_indent_nav then
  return
end

vim.g.loaded_dumb_indent_nav = true

vim.api.nvim_create_user_command("DumbIndentNavHello", function()
  require("dumb-indent-nav").hello()
end, {})
