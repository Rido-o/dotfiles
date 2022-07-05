function setColorscheme(scheme)
    vim.cmd('silent! colorscheme ' .. scheme)
end

vim.o.background = 'dark'

------------------------
----- Colorschemes -----
------------------------

-- Wal
local function pywal()
    setColorscheme('pywal')
end

-- Tokyonight
local function tokyonight()
    vim.g.tokyonight_style = 'night'
    vim.g.tokyonight_disable_italic_comment = '1'
    vim.g.tokyonight_lualine_bold = true
    setColorscheme('tokyonight')
end

-- Kanagawa
local function kanagawa()
    setColorscheme('kanagawa')
end

---------------------------
----- Selected Scheme -----
---------------------------

kanagawa()
