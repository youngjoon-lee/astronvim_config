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
          "--features=libp2p"
        },
      },
      cargo = {
        features = {
          "libp2p"
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

