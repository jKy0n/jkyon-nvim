local plugins = {
  require("config.plugins.catppuccin"),
  require("config.plugins.minimap"),
  require("config.plugins.cord"),
  require("config.plugins.minuet"),
  require("config.plugins.gentoo-syntax"),
  require("config.plugins.pkgbuild-syntax"),
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
