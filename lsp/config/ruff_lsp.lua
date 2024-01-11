return {
  on_attach = function(client, bufnr)
    -- Organize imports via code action on save
    -- https://discord.com/channels/939594913560031363/1139628584487633037/1142229854167765002
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.code_action {
          context = { only = { "source.organizeImports" } },
          apply = true,
        }
        vim.wait(100)
      end,
    })
  end,
}
