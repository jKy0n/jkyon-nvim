return {
  spec = { src = "https://github.com/nvim-mini/mini.icons", name = "mini.icons", version = "stable" },
  config = function()
    require("mini.icons").setup() -- style = "glyph" é o padrão -- exige Nerd Font, que você já tem
  end,
}
