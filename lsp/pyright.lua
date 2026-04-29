return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  single_file_support = true,
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { "*" },
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "off",
        useLibraryCodeForTypes = true,
      },
    },
  },
}
