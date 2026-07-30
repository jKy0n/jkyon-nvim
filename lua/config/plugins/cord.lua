return {
  spec = { src = "https://github.com/vyfor/cord.nvim", name = "cord" },
  config = function()
    require("cord").setup({
      editor = {
        client = "neovim",
      },
      display = {
        show_time = true,       -- mostra há quanto tempo você tá no arquivo
        show_repository = true, -- mostra botão "View repository" se o projeto tiver remote git (funciona com o jkyon-nvim!)
      },
    })
  end,
}
