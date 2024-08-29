if not vim.g.vscode then return {
  "tpope/vim-fugitive",
  config = function() 
    vim.keymap.set("n", "<leader>og", vim.cmd.Git)
  end
} else return {} end
