return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          local b = { buffer = bufnr }

          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          vim.diagnostic.config({
            virtual_text = true,
            severity_sort = true,
          })
          -- Grouped code actions
          vim.keymap.set("n", "<leader>ca", function()
            vim.cmd.RustLsp("codeAction")
          end, b)
          -- Docs.rs keybind
          vim.keymap.set("n", "<leader>od", function()
            vim.cmd.RustLsp("openDocs")
          end, b)
          -- Cargo command keybinds
          vim.keymap.set("n", "<leader>cr", vim.cmd.Crun, b)
          vim.keymap.set("n", "<leader>cb", vim.cmd.Cbuild, b)
          vim.keymap.set("n", "<leader>cc", vim.cmd.Ccheck, b)
        end,

        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              features = "all",
            },
          },
        },
      },
    }
  end,
  cond = not vim.g.vscode,
}
