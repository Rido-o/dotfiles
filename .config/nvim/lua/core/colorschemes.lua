local function setColorscheme(scheme)
    vim.cmd('silent! colorscheme ' .. scheme)
end

-- Themes
local themes = {
    pywal = function()
        setColorscheme('pywal')
    end,
    tokyonight = function()
        vim.g.tokyonight_style = 'night'
        vim.g.tokyonight_disable_italic_comment = '1'
        setColorscheme('tokyonight')
    end,
    kanagawa = function()
        require('kanagawa').setup({ globalStatus = true })
        setColorscheme('kanagawa')
    end,
}

-- Selected theme
pcall(themes.kanagawa)
