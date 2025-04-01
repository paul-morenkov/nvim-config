  return {
    "smoka7/hop.nvim",
    version = "*",
    config = function()
      local hop = require("hop")
      hop.setup()
      -- vim.keymap.set('', 'f', function() hop.hint_char1() end, {desc = "Hop 1 Char"})
    end,
  }
