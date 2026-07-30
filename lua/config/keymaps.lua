vim.g.mapleader = " "
-- keymaps entram aqui conforme forem sendo precisos

-- Comentar linha/seleção, estilo VSCode (Ctrl + /)
-- remap = true é necessário pq gcc/gc são mapeamentos nativos do core,
-- não comandos crus -- sem isso o Neovim tentaria digitar "g", "c", "c" literalmente
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Comentar linha" })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, desc = "Comentar seleção" })
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Comentar linha" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, desc = "Comentar seleção" })
