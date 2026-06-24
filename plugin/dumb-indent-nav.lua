if vim.g.loaded_dumb_indent_nav then
    return
end

vim.g.loaded_dumb_indent_nav = true

vim.api.nvim_create_user_command("DumbIndentNavHello", function()
    require("dumb-indent-nav").hello()
end, {})

vim.api.nvim_create_user_command("DumbIndentNavNextSameIndent", function(command)
    require("dumb-indent-nav").goto_next_same_indent(command.count)
end, {count = true})

vim.api.nvim_create_user_command("DumbIndentNavPrevSameIndent", function(command)
    require("dumb-indent-nav").goto_prev_same_indent(command.count)
end, {count = true})
