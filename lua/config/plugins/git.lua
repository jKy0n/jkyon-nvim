return {
  spec = { src = "https://github.com/nvim-mini/mini-git", name = "mini.git", version = "stable" },
  config = function()
    require("mini.git").setup()
  end,
}
