return {
  spec = { src = "https://github.com/nvim-mini/mini.map", name = "mini.map", version = "stable" },
  config = function()
    local minimap = require("mini.map")
    minimap.setup({
      integrations = {
        minimap.gen_integration.diagnostic(), -- usa o LSP nativo do Neovim, sem plugin extra
      },
    })
    minimap.open() -- abre já no start, pra ficar visível igual o VSCode

    vim.keymap.set("n", "<leader>mm", minimap.toggle, { desc = "Toggle minimap" })
    vim.keymap.set("n", "<leader>mf", minimap.toggle_focus, { desc = "Foca no minimap" })
  end,
}
