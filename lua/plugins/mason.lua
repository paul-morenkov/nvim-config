return {
  "williamboman/mason.nvim",
  lazy = false,
  opts = {
    PATH = "prepend",
  },
  cond = not vim.g.vscode,
}
