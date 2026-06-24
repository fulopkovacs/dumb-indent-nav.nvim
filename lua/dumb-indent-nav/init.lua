local M = {}

function M.setup(opts)
    M.opts = opts or {}
end

function M.hello()
    print("Hello from dumb-indent-nav.nvim")
end

local function find_same_indent(direction)
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local current_indent = vim.fn.indent(current_line)
    local last_line = vim.api.nvim_buf_line_count(0)

    for line = current_line + direction, direction > 0 and last_line or 1, direction do
        local text = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]

        if text:find("%S") and vim.fn.indent(line) == current_indent then
            return line
        end
    end
end

function M.find_next_same_indent()
    return find_same_indent(1)
end

function M.find_prev_same_indent()
    return find_same_indent(-1)
end

local function is_last_line()
    return vim.api.nvim_win_get_cursor(0)[1] == vim.api.nvim_buf_line_count(0)
end

local function is_first_line()
    return vim.api.nvim_win_get_cursor(0)[1] == 1
end

local function goto_line(line)
    if not line then
        return false
    end

    local current_col = vim.api.nvim_win_get_cursor(0)[2]
    vim.api.nvim_win_set_cursor(0, {
        line,
        current_col,
    })
    return true
end

function M.goto_next_same_indent()
    if is_last_line() then
        print("Already at last line")
    end

    return goto_line(M.find_next_same_indent())
end

function M.goto_prev_same_indent()
    if is_first_line() then
        print("Already at first line")
    end

    return goto_line(M.find_prev_same_indent())
end

return M
