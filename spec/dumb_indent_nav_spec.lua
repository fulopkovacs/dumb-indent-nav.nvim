local nav = require("dumb-indent-nav")

local lines = {
  "function hello(name: string) {",
  "    // this is the greeting",
  "    const greeting = `Hello ${name}!`;",
  "    ",
  "    return greeting;",
  "}",
}

describe("same indent navigation", function()
  local original_print
  local messages

  before_each(function()
    original_print = print
    messages = {}
    _G.print = function(message)
      table.insert(messages, message)
    end

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.api.nvim_win_set_cursor(0, { 3, 6 })
  end)

  after_each(function()
    _G.print = original_print
  end)

  it("goes to the next line with the same indent", function()
    assert.is_true(nav.goto_next_same_indent())
    assert.are.same({ 5, 6 }, vim.api.nvim_win_get_cursor(0))
  end)

  it("goes to the previous line with the same indent", function()
    assert.is_true(nav.goto_prev_same_indent())
    assert.are.same({ 2, 6 }, vim.api.nvim_win_get_cursor(0))
  end)

  it("prints a message when trying to go next from the last line", function()
    vim.api.nvim_win_set_cursor(0, { 6, 0 })

    assert.is_false(nav.goto_next_same_indent())
    assert.are.same({ 6, 0 }, vim.api.nvim_win_get_cursor(0))
    assert.are.same({ "Already at last line" }, messages)
  end)

  it("prints a message when trying to go previous from the first line", function()
    vim.api.nvim_win_set_cursor(0, { 1, 0 })

    assert.is_false(nav.goto_prev_same_indent())
    assert.are.same({ 1, 0 }, vim.api.nvim_win_get_cursor(0))
    assert.are.same({ "Already at first line" }, messages)
  end)
end)
