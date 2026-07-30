# ⌨️ jkyon-nvim ⚙️

Configuração de Neovim construída do zero, sem framework de plugin manager — só o [`vim.pack`](https://neovim.io/doc/user/pack.html) nativo (Neovim 0.12+).

> Sucessora da minha config baseada em [AstroNvim](https://github.com/jKy0n/AstroNvim.config). Trocada por algo mais enxuto e 100% sob meu controle.

![face](https://github.com/jKy0n/jkyon-nvim/blob/master/media/jkyon-nvim-2026-07-30_15%3A52.png)

## Filosofia

- **KISS / Unix philosophy**: sem abstração que eu não entenda ou não precise.
- **Zero plugin manager externo**: `vim.pack` é parte do core do Neovim desde a 0.12, mantido pelo mesmo time do editor.
- **1 plugin = 1 arquivo**: cada plugin vive em `lua/config/plugins/<nome>.lua`, retornando `{ spec, config }`. O `init.lua` da pasta agrega tudo e chama `vim.pack.add()` uma única vez.

## Requisitos

- Neovim **0.12+** (obrigatório — é onde o `vim.pack` existe)
- `git` **2.38+** (necessário pro `mini.diff`)
- `curl` (usado pelo cord.nvim pra baixar o binário do servidor, e pelo minuet-ai.nvim pra falar com o Ollama)
- [Ollama](https://ollama.com) rodando em algum host da rede Tailscale com o modelo `qwen2.5-coder:3b` — necessário só pro autocomplete (minuet-ai.nvim)
- Uma **Nerd Font** configurada no terminal — necessário pros ícones da statusline/minimap

## 🛠️ Instalação

#### 1. Backup da config atual

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### 2. Clonar o repositório

```shell
git clone https://github.com/jKy0n/jkyon-nvim.git ~/.config/nvim # HTTPS
# ou
git clone git@github.com:jKy0n/jkyon-nvim.git ~/.config/nvim     # SSH (recomendado)
```

#### 3. Abrir o Neovim

Na primeira execução, `vim.pack.add()` clona todos os plugins automaticamente:

```shell
nvim
```

> Quer testar em paralelo sem sobrescrever uma config existente? Use `NVIM_APPNAME=jkyon-nvim nvim` — o Neovim isola config, dados, estado e cache num perfil separado (`:h $NVIM_APPNAME`). Foi assim que essa config foi testada antes de virar a oficial.

## Gerenciar plugins

Sem `:Lazy`. É tudo via `vim.pack`, direto no `:lua` (ou `:h vim.pack` pra referência completa):

```vim
:lua vim.pack.update()                        " checa e mostra buffer de confirmação das atualizações
:lua vim.pack.update({}, { force = true })     " atualiza sem pedir confirmação
:lua vim.pack.del({"nome-do-plugin"})          " remove um plugin do disco
```

Pra adicionar um plugin novo: cria `lua/config/plugins/<nome>.lua` retornando `{ spec = {...}, config = function() ... end }` e adiciona um `require("config.plugins.<nome>")` na lista do `lua/config/plugins/init.lua`.

## O que tem aqui dentro

| Plugin | Função |
|---|---|
| [catppuccin/nvim](https://github.com/catppuccin/nvim) | Colorscheme (frappe, fundo transparente) |
| [nvim-mini/mini.map](https://github.com/nvim-mini/mini.map) | Minimap lateral, estilo VSCode |
| [nvim-mini/mini.statusline](https://github.com/nvim-mini/mini.statusline) | Barra de status |
| [nvim-mini/mini.icons](https://github.com/nvim-mini/mini.icons) | Provedor de ícones (filetype, statusline) |
| [nvim-mini/mini-git](https://github.com/nvim-mini/mini-git) | Dados de git (branch, HEAD) pra statusline |
| [nvim-mini/mini.diff](https://github.com/nvim-mini/mini.diff) | Diff em tempo real na gutter + estatísticas (+/~/-) na statusline |
| [vyfor/cord.nvim](https://github.com/vyfor/cord.nvim) | Discord Rich Presence |
| [milanglacier/minuet-ai.nvim](https://github.com/milanglacier/minuet-ai.nvim) | Autocomplete via Ollama local (FIM) |
| [gentoo/gentoo-syntax](https://github.com/gentoo/gentoo-syntax) | Syntax highlighting pra ebuild/eclass |
| [Firef0x/PKGBUILD.vim](https://github.com/Firef0x/PKGBUILD.vim) | Syntax highlighting pra PKGBUILD |

## Detalhes de UI

- Fundo transparente (buffer + floats) — herda a cor/imagem do terminal.
- `cmdheight = 0` — sem linha de comando ociosa ocupando espaço, tela maximizada pro código.
- Comentário de linha/seleção nativo do Neovim (`gcc`/`gc`), mapeado em `Ctrl + /`.

## Máquinas

Repositório compartilhado entre **TheseusMachine** (Gentoo) e **Viamar-PC** (Arch), via Tailscale. Plugins específicos de distro (`gentoo-syntax`, `PKGBUILD.vim`) são escopados por filetype — instalados nos dois, mas só ativam onde fazem sentido.

Enjoy! =)