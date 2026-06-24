# dumb-indent-nav.nvim

Minimal Lua Neovim plugin.

## Usage

```lua
{
  "dumb-indent-nav.nvim",
  dev = true,
  config = function()
    require("dumb-indent-nav").setup()
  end,
}
```

Then run:

```vim
:DumbIndentNavHello
```

## Same Indent Navigation

Find the next or previous line with the same indentation as the current line:

```lua
local nav = require("dumb-indent-nav")

local next_line = nav.find_next_same_indent()
local prev_line = nav.find_prev_same_indent()
```

Move the cursor directly:

```lua
require("dumb-indent-nav").goto_next_same_indent()
require("dumb-indent-nav").goto_prev_same_indent()
```

Or use the commands:

```vim
:DumbIndentNavNextSameIndent
:DumbIndentNavPrevSameIndent
```

## Development

Run tests:

```sh
make test
```

Generate Vim help documentation from Lua annotations:

```sh
make docgen
```
