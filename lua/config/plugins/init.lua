local plugins = {
  require("config.plugins.catppuccin"),
  require("config.plugins.minimap"),
  require("config.plugins.cord"),
  require("config.plugins.minuet"),
  require("config.plugins.gentoo-syntax"),
  require("config.plugins.pkgbuild-syntax"),
  require("config.plugins.icons"),
  require("config.plugins.git"),
  require("config.plugins.diff"),
  require("config.plugins.statusline"),
}

local specs = {}
for _, p in ipairs(plugins) do
  table.insert(specs, p.spec)
end

vim.pack.add(specs)

for _, p in ipairs(plugins) do
  if p.config then
    p.config()
  end
end
