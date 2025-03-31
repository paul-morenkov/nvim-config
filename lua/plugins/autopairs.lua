  return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    cond = not vim.g.vscode
  }
