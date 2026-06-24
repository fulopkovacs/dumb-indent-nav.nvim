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
  before_each(function()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.api.nvim_win_set_cursor(0, { 3, 6 })
  end)

  it("goes to the next line with the same indent", function()
    assert.is_true(nav.goto_next_same_indent())
    assert.are.same({ 5, 6 }, vim.api.nvim_win_get_cursor(0))
  end)

  it("goes to the previous line with the same indent", function()
    assert.is_true(nav.goto_prev_same_indent())
    assert.are.same({ 2, 6 }, vim.api.nvim_win_get_cursor(0))
  end)
end)
