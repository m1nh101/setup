local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.omnisharp.setup {
  cmd = { "/home/m1nh/.local/share/nvim/mason/packages/omnisharp/omnisharp" },
  filetypes = { "cs", "razor", "cshtml" },
  capabilities = capabilities,
  enable_import_completion = true,
  organize_imports_on_format = true,
  enable_roslyn_analyzers = true,
  root_dir = function ()
    return vim.loop.cwd() -- current working directory
  end,
  settings = {
    FormattingOptions = {
      EnableEditorConfigSupport = true,
    },
  }
}

lspconfig.pylsp.setup {
}