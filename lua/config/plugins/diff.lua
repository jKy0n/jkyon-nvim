return {
  spec = { src = "https://github.com/nvim-mini/mini.diff", name = "mini.diff", version = "stable" },
  config = function()
    require("mini.diff").setup()
    -- default: compara buffer contra o índice do git (source = "git")
    -- exige git >= 2.38.0 -- seu Arch/Gentoo com certeza já tem mais novo que isso
  end,
}
