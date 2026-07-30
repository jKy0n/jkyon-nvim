return {
  spec = { src = "https://github.com/nvim-mini/mini.map", name = "mini.map", version = "stable" },
  config = function()
    local minimap = require("mini.map")
    minimap.setup({
      integrations = {
        minimap.gen_integration.diagnostic(),
      },
      window = {
        winblend = 0, -- evita o bug de fundo preto em float transparente (neovim#18576)
      },
    })
    minimap.open()

    vim.keymap.set("n", "<leader>mm", minimap.toggle, { desc = "Toggle minimap" })
    vim.keymap.set("n", "<leader>mf", minimap.toggle_focus, { desc = "Foca no minimap" })
  end,
}
