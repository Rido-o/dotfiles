function setColorscheme(scheme)
    vim.cmd('silent! colorscheme ' .. scheme)
end

vim.o.background = 'dark'

------------------------
----- Colorschemes -----
------------------------

-- Wal
local function wal()
    setColorscheme('wal')
end

-- Gruvbox
local function gruvbox()
    setColorscheme('gruvbox')
end

-- Onedark
local function onedark()
    setColorscheme('onedark')
end

-- Pencil
local function pencil()
    setColorscheme('pencil')
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

-- Miramare
local function miramare()
    vim.g.miramare_enable_italic = '1'
    vim.g.miramare_disable_italic_comment = '1'
    setColorscheme('miramare')
end

-- Horizon
local function horizon()
    setColorscheme('horizon')
end

---------------------------
----- Selected Scheme -----
---------------------------

kanagawa()
