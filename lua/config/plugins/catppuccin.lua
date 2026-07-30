return {
  spec = { src = "https://github.com/catppuccin/nvim", name = "catppuccin", version = "stable" },
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      background = {
        light = "latte",
        dark = "frappe",
      },
      transparent_background = true, -- fundo do buffer principal
      float = {
        transparent = true, -- fundo de popups/floats (LSP hover, completion, minimap...)
      },
      integrations = {
        treesitter = true,
        native_lsp = { enabled = true },
      },
    })
    vim.cmd.colorscheme("catppuccin")

    -- Necessário pro float.transparent funcionar de verdade:
    -- com winblend/pumblend diferente de 0, existe um bug conhecido do Neovim
    -- (#18576) onde a janela flutuante renderiza PRETO sólido em vez de
    -- transparente, quando combinado com bg = none. Zerando aqui evita isso.
    vim.o.winblend = 0
    vim.o.pumblend = 0
  end,
}
