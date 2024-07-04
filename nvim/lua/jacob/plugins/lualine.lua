local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local theme = require("lualine.themes.dracula")

theme.command = {
  a = {
    gui = "bold",
    bg = "#FFDA7B",
    fg = "#000000"
  },
}

lualine.setup({options = {theme = theme}})
