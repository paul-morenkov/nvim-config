if not vim.g.vscode then
  return {
    "smoka7/hop.nvim",
    version = "*",
    config = function()
      hop = require("hop")
      hop.setup()
      vim.keymap.set('', 'f', function() hop.hint_char1() end, {desc = "Hop 1 Char"})
    end,
  }
else
  return {}
end
