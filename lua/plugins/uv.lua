return {
  "benomahony/uv.nvim",
  dependenices = {
    "folke/snacks.nvim",
  },
  opts = {
    picker_integration = true,
  },
  cond = not vim.g.vscode,
}
