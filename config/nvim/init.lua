local init_modules = {
    "settings",
    "plugins",
    "mappings",
    "autocmds",
    "highlights",
    "commands",
}

for _, module in ipairs(init_modules) do
    local ok, err = pcall(require, module)

    if not ok then
        error("Error loading " .. module .. "\n\n" .. err)
    end
end

vim.cmd([[ silent! colo base16-default-dark ]])
