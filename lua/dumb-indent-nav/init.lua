local M = {}

function M.setup(opts)
  M.opts = opts or {}
end

function M.hello()
  print("Hello from dumb-indent-nav.nvim")
end

return M
