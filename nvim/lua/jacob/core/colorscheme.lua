local status, _ = pcall(vim.cmd, "colorscheme kanagawa")

if not status then
    print("Colorscheme missing")
    return
end
