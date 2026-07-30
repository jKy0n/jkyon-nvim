return {
  spec = { src = "https://github.com/catppuccin/nvim", name = "catppuccin", version = "stable" },
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      background = {
        light = "latte",
        dark = "frappe",
      },
      integrations = {
        treesitter = true,
        native_lsp = { enabled = true },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
