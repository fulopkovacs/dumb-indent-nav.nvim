# dumb-indent-nav.nvim

Navigate based on indents like a caveman.

## Usage

With [`lazy.nvim`](https://github.com/folke/lazy.nvim):

```lua
{
  "dumb-indent-nav.nvim",
  config = function()
    require("dumb-indent-nav").setup()
  end,
}
```

There are no default key mappings, this is what I use:

```lua
{
  "dumb-indent-nav.nvim",
  -- Recommended keys (not default)
  keys = {
    {
        "<M-n>",
        function()
            require("dumb-indent-nav").goto_next_same_indent()
        end,
        desc = "next dumb indent nav",
        mode = {
            "n",
            "x",
        },
    }, {
        "<M-p>",
        function()
            require("dumb-indent-nav").goto_prev_same_indent()
        end,
        desc = "prev dumb indent nav",
        mode = {
            "n",
            "x",
        },
    },
  },
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

Counts are supported. For example, if `<M-n>` calls `goto_next_same_indent()`,
then `3<M-n>` moves to the third next line with the same indent.

Or use the commands:

```vim
:DumbIndentNavNextSameIndent
:DumbIndentNavPrevSameIndent
```

## Development

Install the plugin in `dev` mode:

```lua
{
  "dumb-indent-nav.nvim",
    config = function()
    require("dumb-indent-nav").setup()
  end,
}
```

Run tests:

```sh
make test
```

Generate Vim help documentation from Lua annotations:

```sh
make docgen
```
