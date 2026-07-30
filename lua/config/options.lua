local o = vim.opt

o.number = true
o.relativenumber = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.termguicolors = true
o.signcolumn = "yes"
o.clipboard = "unnamedplus"

o.cmdheight = 0  -- esconde a linha de comando quando ociosa; recupera 1 linha inteira pro código
o.laststatus = 3 -- garante 1 statusline global (obrigatório ter alguma visível quando cmdheight = 0)
