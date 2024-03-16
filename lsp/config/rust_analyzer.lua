return {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        overrideCommand = {
          "cargo",
          "clippy",
          "--workspace",
          "--message-format=json",
          "--all-targets",
          "--features=mixnet"
        },
      },
      cargo = {
        features = {
          "mixnet"
        },
      },
      diagnostics = {
        disabled = {
          "unresolved-proc-macro",
        },
      },
      -- procMacro = {
      --   enable = false,
      -- },
      -- inlayHints = {
      --   locationLinks = false,
      -- },
    },
  },
}

