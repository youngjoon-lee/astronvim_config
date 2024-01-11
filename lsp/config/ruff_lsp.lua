return {
  on_attach = function(client, bufnr)
    -- Organize imports via code action on save
    -- https://discord.com/channels/939594913560031363/1139628584487633037/1144364723941429279
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        local timeout_ms = 1000
        local params = vim.lsp.util.make_range_params()
        params.context = {
          only = { "source.organizeImports" },
          triggerKind = vim.lsp.protocol.CodeActionTriggerKind.Automatic,
          diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr),
        }
        local resp, err = client.request_sync("textDocument/codeAction", params, timeout_ms, bufnr)
        if err ~= nil then vim.notify(err) end
        if resp.result ~= nil and resp.result[1] ~= nil and resp.result[1].edit ~= nil then
          vim.lsp.util.apply_workspace_edit(resp.result[1].edit, client.offset_encoding)
        end
      end,
      group = vim.api.nvim_create_augroup("RuffLspCodeAction", { clear = true }),
    })
  end,
}
