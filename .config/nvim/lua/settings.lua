-----------------
-- Settings
-----------------
local default_options = {
    encoding = 'utf-8',             -- The encoding displayed is UTF-8 by default
    fileencoding = 'utf-8',
    fileencodings = 'utf-8',        -- Causes problems with fugitive
    splitbelow = true,              -- Split down instead of up
    splitright = true,              -- Split right instead of left
    clipboard = 'unnamedplus',      -- Copy and paste between everything
    number = true,                  -- Shows the current line number
    relativenumber = true,          -- Enables the relative numberline
    cursorline = true,              -- Change the cursor in insert mode
    linespace = 0,                  -- Set the space between lines
    expandtab = true,
    tabstop = 4,
    softtabstop = 4,                -- Set the width of tabs and space tabs
    shiftwidth = 4,                 -- Change the number of space character for indentation
    smartindent = true,             -- Makes indenting smart
    wrap = false,                   -- Display long lines as just one line
    swapfile = false,               -- Disable swap files
    backup = false,                 -- Disable backup files
    undofile = true,                -- Allow undo files
    ignorecase = true,
    smartcase = true,
    colorcolumn = '0',              -- Set how far the color column should be
    scrolloff = 5,                  -- How close the cursor should be before the page scrolls
    timeoutlen = 250,               -- Default is 1000, normally set to 500, used for which key
    updatetime = 100,               -- For vim signify
    signcolumn = 'yes:1',           -- Add permanant column for signs on the left
    termguicolors = true,           -- Required for some color schemes and colorizer
    undodir = vim.fn.stdpath('cache') .. '/undo',-- Undo directory
    list = true,
    listchars = 'trail:-,tab:  ',   -- 'trail:­,tab:  ,extends:»,precedes:«,nbsp:⣿,eol:¬'
    laststatus = 3,                 -- Enables global statusline
    -- cmdheight = 0,                  -- Makes command line height 0 -- In preperation for when it is added to stable
}

for k, v in pairs(default_options) do
    vim.o[k] = v
end

-- Disable auto-commenting
vim.api.nvim_create_autocmd({"BufRead", "BufEnter"}, {command = "setlocal formatoptions-=cro"})

-- Set shell to Windows PowerShell if on windows. Relies on function in init.lua
vim.cmd([[
if g:os == 'Windows'
    set shell=powershell shellquote= shellpipe=\| shellxquote=
    set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
    set shellredir=\|\ Out-File\ -Encoding\ UTF8
end
]])
