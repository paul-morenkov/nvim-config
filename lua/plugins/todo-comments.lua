if not vim.g.vscode then
  return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = true,
  }
else
  return {}
end
