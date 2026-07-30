return {
  spec = { src = "https://github.com/milanglacier/minuet-ai.nvim", name = "minuet" },
  config = function()
    require("minuet").setup({
      provider = "openai_fim_compatible",
      n_completions = 1, -- 1 request por vez -- modelo local não aguenta gerar várias opções em paralelo
      context_window = 512, -- ponto de partida recomendado pela doc pra modelo local; sobe conforme a 3B aguentar
      request_timeout = 6, -- espelha o modelTimeout: 6000 do seu config.yaml do Continue.dev
      debounce = 300, -- espelha o debounceDelay: 300 do mesmo arquivo
      provider_options = {
        openai_fim_compatible = {
          api_key = "TERM", -- só o NOME de uma env var qualquer que já existe -- Ollama não usa auth de verdade
          name = "Ollama",
          end_point = "http://100.100.10.10:11434/v1/completions",
          model = "qwen2.5-coder:3b",
          optional = {
            max_tokens = 128,
            top_p = 0.9,
          },
        },
      },
      virtualtext = {
        auto_trigger_ft = { "*" }, -- sugestão automática em qualquer filetype, igual o Continue.dev fazia
        keymap = {
          accept = "<A-A>",       -- Alt+Shift+A: aceita a sugestão inteira
          accept_line = "<A-a>",  -- Alt+a: aceita só a linha atual
          accept_n_lines = "<A-z>",
          prev = "<A-[>",
          next = "<A-]>",
          dismiss = "<A-e>",
        },
      },
    })
  end,
}
